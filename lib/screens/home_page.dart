import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {
      'id': 0,
      'name': 'Iklan 0',
      'type': 'ads',
      'price': 'Rp650.000',
      'image': 'assets/ads0.jpg',
      'description': ''
    },
    {
      'id': 1,
      'name': 'Gaun Nikah 1',
      'type': 'product',
      'price': 'Rp350.000',
      'image': 'assets/gaun1.jpg',
      'description':
          'Gaun nikah yang sederhana namun elegan, cocok untuk momen '
              'istimewa Anda. Dilengkapi dengan detail renda yang halus dan '
              'potongan yang pas untuk memberikan kesan anggun. Material yang '
              'nyaman membuat gaun ini mudah dikenakan sepanjang hari. Pilihan '
              'sempurna untuk tampil cantik dan mempesona.'
    },
    {
      'id': 2,
      'name': 'Gaun Nikah 2',
      'type': 'product',
      'price': 'Rp400.000',
      'image': 'assets/gaun2.jpg',
      'description':
          'Gaun nikah dengan desain klasik yang abadi. Dirancang untuk '
              'mereka yang menyukai gaya tradisional namun tetap modern. '
              'Gaun ini memiliki aksen bordir yang mewah dan akan memberikan '
              'kesan romantis pada hari spesial Anda. Nyaman dikenakan sepanjang '
              'acara dengan bahan yang lembut dan berkualitas tinggi.'
    },
    {
      'id': 3,
      'name': 'Gaun Nikah 3',
      'type': 'product',
      'price': 'Rp450.000',
      'image': 'assets/gaun3.jpg',
      'description':
          'Menonjolkan kesan mewah dengan sentuhan modern, gaun ini hadir '
              'dengan detail perhiasan yang berkilau di bagian dada. Dirancang '
              'untuk memberikan kesan anggun dan elegan pada saat yang sama. '
              'Material premium membuat gaun ini terlihat mahal dan eksklusif. '
              'Ideal bagi pengantin yang ingin tampil menawan.'
    },
    {
      'id': 4,
      'name': 'Gaun Nikah 4',
      'type': 'product',
      'price': 'Rp500.000',
      'image': 'assets/gaun4.jpg',
      'description':
          'Gaun yang memancarkan kemewahan dengan detail yang artistik. '
              'Didesain khusus untuk menonjolkan lekuk tubuh dengan potongan '
              'yang ramping. Dilengkapi dengan detail manik-manik yang indah, '
              'gaun ini menambahkan sentuhan glamor pada penampilan Anda. '
              'Pilihan yang tepat untuk hari pernikahan yang tak terlupakan.'
    },
    {
      'id': 6,
      'name': 'Iklan 1',
      'type': 'ads',
      'price': 'Rp650.000',
      'image': 'assets/ads1.jpg',
      'description': ''
    },
    {
      'id': 5,
      'name': 'Gaun Nikah 5',
      'type': 'product',
      'price': 'Rp600.000',
      'image': 'assets/gaun5.jpg',
      'description': 'Gaun nikah cantik yang memberikan kesan glamor dan modern. '
          'Dibuat dengan material premium yang nyaman dan mudah bergerak. '
          'Detail renda di seluruh gaun ini memberikan tampilan yang romantis '
          'dan elegan. Cocok untuk pengantin yang ingin tampil mewah.'
    },
    {
      'id': 7,
      'name': 'Gaun Nikah 6',
      'type': 'product',
      'price': 'Rp700.000',
      'image': 'assets/gaun6.jpg',
      'description': 'Gaun nikah yang sempurna untuk acara pernikahan formal. '
          'Dihiasi dengan renda klasik dan potongan yang ramping untuk kesan feminin. '
          'Bagian bawah yang mengembang menambah sentuhan anggun. '
          'Pilihan ideal bagi pengantin yang ingin tampil klasik dan memukau.'
    },
    {
      'id': 8,
      'name': 'Gaun Nikah 7',
      'type': 'product',
      'price': 'Rp750.000',
      'image': 'assets/gaun7.jpg',
      'description':
          'Dengan desain yang elegan dan material berkualitas tinggi, gaun ini '
              'mewakili perpaduan antara keanggunan dan kenyamanan. '
              'Detail renda pada bagian atas dan rok yang flowy membuatnya cocok '
              'untuk acara formal. Gaun ini dirancang untuk membuat setiap pengantin '
              'merasa spesial di hari bahagianya.'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/account');
    }
  }

  void _onProductTap(Map<String, dynamic> item) {
    Navigator.pushNamed(context, '/detail', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9F2F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFD9F2F9),
        title: const Text(
          'Ergown Fashion',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: items.map((item) {
              return StaggeredGridTile.count(
                crossAxisCellCount: item['type'] == 'ads' ? 2 : 1,
                mainAxisCellCount: item['type'] == 'ads' ? 1 : 1.5,
                child: GestureDetector(
                  onTap: () {
                    if (item['type'] == 'product') _onProductTap(item);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    color: item['type'] == 'ads'
                        ? Colors.orangeAccent
                        : Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10),
                            ),
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        if (item['type'] == 'product') ...[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 1.0),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            item['price'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Color(0xFFD9F2F9),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
