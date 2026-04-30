/*
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Aluno on AlunoBase, Store {
  late final _$nomeAtom = Atom(name: 'AlunoBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$matriculaAtom =
      Atom(name: 'AlunoBase.matricula', context: context);

  @override
  String get matricula {
    _$matriculaAtom.reportRead();
    return super.matricula;
  }

  @override
  set matricula(String value) {
    _$matriculaAtom.reportWrite(value, super.matricula, () {
      super.matricula = value;
    });
  }

  late final _$AlunoBaseActionController =
      ActionController(name: 'AlunoBase', context: context);

  @override
  void cadastrarAluno(String nome, String matricula) {
    final _$actionInfo = _$AlunoBaseActionController.startAction(
        name: 'AlunoBase.cadastrarAluno');
    try {
      return super.cadastrarAluno(nome, matricula);
    } finally {
      _$AlunoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
matricula: ${matricula}
    ''';
  }
}


*/