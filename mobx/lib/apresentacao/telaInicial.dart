import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../servico/entidade/loja_store.dart';

final loja = LojaStore();

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MercadoLivreClone();
  }
}

class MercadoLivreClone extends StatelessWidget {
  const MercadoLivreClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: const Color(0xFFFFE600),
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Text("FP", style: TextStyle(fontSize: 10, color: Colors.black)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.search, color: Colors.grey, size: 20),
                          SizedBox(width: 10),
                          Text("Buscar no Mercado Livre", style: TextStyle(color: Colors.grey, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  Icon(Icons.location_on_outlined, size: 14),
                  Text(" Enviar para Rua CL-01 00", style: TextStyle(fontSize: 11)),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(colors: [Colors.purple, Colors.pink]),
              ),
              child: const Center(
                child: Text("70% OFF - RENOVE SUA CASA",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF341B6E),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("meli+ | Viva toda a experiência", style: TextStyle(color: Colors.white, fontSize: 11)),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _IconItem(Icons.credit_card, "Cartão"),
                _IconItem(Icons.percent, "Ofertas"),
                _IconItem(Icons.attach_money, "Afiliados"),
                _IconItem(Icons.play_circle_fill, "Videos"),
                _IconItem(Icons.local_offer, "Cupons"),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 5),
              child: Text("OFERTAS RELÂMPAGO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  const Text("Termina em:", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(width: 8),
                  Observer(
                    builder: (_) => Text(
                      loja.tempoRestante,
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                children: [
                  Observer(
                    builder: (_) => _DealCard(
                      label: "Aspirador Pó",
                      originalPrice: loja.precoOriginalRelampago['aspirador'] ?? '0,00',
                      discount: loja.descontosRelampago['aspirador'] ?? '',
                      discountedPrice: loja.ofertasRelampago['aspirador'] ?? '0,00',
                    ),
                  ),
                  Observer(
                    builder: (_) => _DealCard(
                      label: "Fone Bluetooth",
                      originalPrice: loja.precoOriginalRelampago['fone'] ?? '0,00',
                      discount: loja.descontosRelampago['fone'] ?? '',
                      discountedPrice: loja.ofertasRelampago['fone'] ?? '0,00',
                    ),
                  ),
                  Observer(
                    builder: (_) => _DealCard(
                      label: "Smartwatch",
                      originalPrice: loja.precoOriginalRelampago['smartwatch'] ?? '0,00',
                      discount: loja.descontosRelampago['smartwatch'] ?? '',
                      discountedPrice: loja.ofertasRelampago['smartwatch'] ?? '0,00',
                    ),
                  ),
                  Observer(
                    builder: (_) => _DealCard(
                      label: "Teclado Gamer",
                      originalPrice: loja.precoOriginalRelampago['teclado'] ?? '0,00',
                      discount: loja.descontosRelampago['teclado'] ?? '',
                      discountedPrice: loja.ofertasRelampago['teclado'] ?? '0,00',
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              child: Text("Itens", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                Observer(
                  builder: (_) => _ProductCard(name: "Bolsa Tiracolo", price: loja.produtosNormais['bolsa'] ?? '0,00', imagePath: 'assets/imagens/download.jpg'),
                ),
                Observer(
                  builder: (_) => _ProductCard(name: "Tênis Esportivo", price: loja.produtosNormais['tenis'] ?? '0,00', imagePath: 'assets/imagens/download (1).jpg'),
                ),
                Observer(
                  builder: (_) => _ProductCard(name: "Cadeira Office", price: loja.produtosNormais['cadeira'] ?? '0,00', imagePath: 'assets/imagens/download (2).jpg'),
                ),
                Observer(
                  builder: (_) => _ProductCard(name: "Luminária LED", price: loja.produtosNormais['luminaria'] ?? '0,00', imagePath: 'assets/imagens/download (3).jpg'),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: loja.randomizarPrecos,
        backgroundColor: Colors.orange,
        elevation: 4,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home, color: Colors.blue), onPressed: () {}),
              IconButton(icon: const Icon(Icons.list), onPressed: () {}),
              const SizedBox(width: 40),
              IconButton(icon: const Icon(Icons.play_circle_outline), onPressed: () {}),
              IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconItem(this.icon, this.label);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 22, backgroundColor: Colors.white, child: Icon(icon, color: Colors.blue, size: 20)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}

class _DealCard extends StatelessWidget {
  final String label;
  final String originalPrice;
  final String discountedPrice;
  final String discount;
  const _DealCard({required this.label, required this.originalPrice, required this.discountedPrice, required this.discount});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            color: Colors.grey[100],
            width: double.infinity,
            child: Image.asset(
              _getImagePath(label),
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.flash_on, color: Colors.orange),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'R\$ $originalPrice',
            style: const TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough),
          ),
          const SizedBox(height: 2),
          Text(discount, style: const TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 2),
          Text(
            'R\$ $discountedPrice',
            style: const TextStyle(color: Colors.green, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  String _getImagePath(String label) {
    switch (label) {
      case 'Aspirador Pó':
        return 'assets/imagens/D_602645-MLA103616639348_012026-C.jpg';

      case 'Fone Bluetooth':
        return 'assets/imagens/download (4).jpg';

      case 'Smartwatch':
        return 'assets/imagens/download (5).jpg';

      case 'Teclado Gamer':
        return 'assets/imagens/download (6).jpg';

      default:
        return 'assets/imagens/download.jpg';
    }
  }
}

class _ProductCard extends StatelessWidget {
  final String name, price;
  final String imagePath;
  const _ProductCard({required this.name, required this.price, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey[50],
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text("R\$ $price", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Text("em 10x sem juros", style: TextStyle(color: Colors.green, fontSize: 10)),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12, color: Colors.black87), maxLines: 2),
        ],
      ),
    );
  }
}










/*

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'loja_store.dart';

final loja = LojaStore();

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});
  @override
  Widget build(BuildContext context) {
    return const MercadoLivreClone();
  }
}

class MercadoLivreClone extends StatelessWidget {
  const MercadoLivreClone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: const Color(0xFFFFE600),
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(backgroundColor: Colors.white, radius: 16, child: Text("FP", style: TextStyle(fontSize: 10))),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: const Row(children: [SizedBox(width: 10), Icon(Icons.search, size: 20), Text(" Buscar no Mercado Livre")]),
                    ),
                  ),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
              const SizedBox(height: 5),
              const Row(children: [Icon(Icons.location_on_outlined, size: 14), Text(" Enviar para Rua CL-01 00", style: TextStyle(fontSize: 11))]),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 5),
              child: Row(
                children: [
                  const Text("OFERTAS RELÂMPAGO ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),

                  Observer(
                    builder: (_) => Text(
                      loja.tempoRestante, 
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13)
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                children: [
                  Observer(builder: (_) => _DealCard(label: "Aspirador Pó", price: "R\$ ${loja.ofertasRelampago['aspirador']}", discount: "43% OFF")),
                  Observer(builder: (_) => _DealCard(label: "Fone Bluetooth", price: "R\$ ${loja.ofertasRelampago['fone']}", discount: "20% OFF")),
                  _DealCard(label: "Smartwatch", price: "R\$ 199,00", discount: "15% OFF"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 15, top: 20, bottom: 10),
              child: Text("INSPIRADO NO SEU HISTÓRICO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),


            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                Observer(builder: (_) => _ProductCard(name: "Bolsa Tiracolo", price: loja.produtosNormais['bolsa']!, imgIcon: Icons.shopping_bag)),
                Observer(builder: (_) => _ProductCard(name: "Tênis Esportivo", price: loja.produtosNormais['tenis']!, imgIcon: Icons.directions_run)),
                _ProductCard(name: "Cadeira Office", price: "450,00", imgIcon: Icons.chair),
                _ProductCard(name: "Luminária LED", price: "34,20", imgIcon: Icons.lightbulb),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => loja.aplicarDescontoRelampago(),
        child: const Icon(Icons.PriceCheck),
      ),
    );
  }
}


*/