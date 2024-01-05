import 'package:flutter/material.dart';


class DetailBarangPage extends StatefulWidget {
  @override
  _DetailBarangPageState createState() => _DetailBarangPageState();
}

class _DetailBarangPageState extends State<DetailBarangPage> {
  int _currentIndex = 0;

  // Dummy data
  final String gambarUrl = 'https://www.asus.com/media/odin/websites/ID/News/b6iiku0c98okblaj/ROG-STRIX-B760-F-GAMING-WIFI_3D-7.png';
  final String namaBarang = 'Produk Dummy';
  final String hargaBarang = '100';
  final String kategori = 'Kategori Dummy';
  final String spesifikasi = 'Spesifikasi Dummy: Lorem ipsum dolor sit amet, consectetur adipiscing elit.';
  final String deskripsi = 'Deskripsi Dummy: Lorem ipsum dolor sit amet, consectetur adipiscing elit.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Barang',
        style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar Barang
          Center(
            child: Image.network(
              gambarUrl,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 16),

          // Informasi Barang
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  namaBarang,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Harga: \$${hargaBarang}',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Kategori: ${kategori}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Garis Pemisah untuk Spesifikasi
          Container(
            height: 1,
            color: Colors.grey,
          ),

          SizedBox(height: 16),

          // Spesifikasi
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Spesifikasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                spesifikasi,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Garis Pemisah untuk Deskripsi
          Container(
            height: 1,
            color: Colors.grey,
          ),

          SizedBox(height: 16),

          // Deskripsi
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deskripsi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                deskripsi,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.format_list_bulleted),
            label: 'List',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.build),
            label: 'Build',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
