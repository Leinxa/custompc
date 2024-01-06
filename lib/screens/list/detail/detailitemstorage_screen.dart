import 'package:flutter/material.dart';
import 'package:market/model/storage.dart';


class DetailBarangStoragePage extends StatefulWidget {
    final Data data;
  DetailBarangStoragePage({required this.data});
  @override
  _DetailBarangStoragePageState createState() => _DetailBarangStoragePageState();
}

class _DetailBarangStoragePageState extends State<DetailBarangStoragePage> {
  int _currentIndex = 1;
  // Dummy data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Barang',
        style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar Barang
            Center(
              child: Image.network(
                widget.data.imageUrl,
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
                    widget.data.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Harga: Rp.${widget.data.price}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Kategori: Storage',
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
                  widget.data.type,
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
                  widget.data.desc,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
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
