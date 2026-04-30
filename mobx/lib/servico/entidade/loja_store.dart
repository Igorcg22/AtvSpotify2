
import 'dart:async';
import 'dart:math';

import 'package:mobx/mobx.dart';

class LojaStore {
  final Random _random = Random();

  final ObservableMap<String, String> ofertasRelampago = ObservableMap.of({
    'aspirador': '349,90',
    'fone': '89,00',
    'smartwatch': '199,00',
    'teclado': '150,00',
  });

  final ObservableMap<String, String> precoOriginalRelampago = ObservableMap.of({
    'aspirador': '599,90',
    'fone': '111,00',
    'smartwatch': '249,00',
    'teclado': '214,00',
  });

  final ObservableMap<String, String> descontosRelampago = ObservableMap.of({
    'aspirador': '43% OFF',
    'fone': '20% OFF',
    'smartwatch': '15% OFF',
    'teclado': '30% OFF',
  });

  final ObservableMap<String, String> produtosNormais = ObservableMap.of({
    'bolsa': '57,66',
    'tenis': '129,90',
    'cadeira': '450,00',
    'luminaria': '34,20',
    'garrafa': '78,00',
    'mochila': '189,00',
  });

  final Observable<String> tempoRestanteObservable = Observable('');
  late final DateTime fimOferta;
  late final Timer _timer;

  LojaStore({Duration duracao = const Duration(days: 3)}) {
    fimOferta = DateTime.now().add(duracao);
    tempoRestanteObservable.value = _calcularTempoRestante();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      tempoRestanteObservable.value = _calcularTempoRestante();
    });
  }

  String get tempoRestante => tempoRestanteObservable.value;

  String _calcularTempoRestante() {
    final duracao = fimOferta.difference(DateTime.now());
    if (duracao.isNegative) {
      return 'Oferta encerrada';
    }

    final horas = duracao.inHours;
    final minutos = duracao.inMinutes % 60;
    final segundos = duracao.inSeconds % 60;

    return '${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';
  }

  void randomizarPrecos() {
    for (final chave in ofertasRelampago.keys.toList()) {
      final desconto = 10 + _random.nextInt(51);
      final precoOriginal = 80 + _random.nextInt(421) + _random.nextDouble();
      final precoOferta = precoOriginal * (100 - desconto) / 100;
      precoOriginalRelampago[chave] = _formatarPreco(precoOriginal);
      ofertasRelampago[chave] = _formatarPreco(precoOferta);
      descontosRelampago[chave] = '$desconto% OFF';
    }

    for (final chave in produtosNormais.keys.toList()) {
      final preco = 20 + _random.nextInt(481) + _random.nextDouble();
      produtosNormais[chave] = _formatarPreco(preco);
    }
  }

  void atualizarPrecoOferta(String chave, String novoPreco) {
    ofertasRelampago[chave] = novoPreco;
  }

  void atualizarPrecoProduto(String chave, String novoPreco) {
    produtosNormais[chave] = novoPreco;
  }

  double _parsePreco(String preco) {
    final valorSemSimbolo = preco.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.').trim();
    return double.tryParse(valorSemSimbolo) ?? 0.0;
  }

  String _formatarPreco(double valor) {
    return valor.toStringAsFixed(2).replaceAll('.', ',');
  }

  void dispose() {
    _timer.cancel();
  }
}
