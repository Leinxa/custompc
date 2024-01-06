import 'package:flutter/material.dart';
import 'package:market/screens/page/motherboardpage.dart';
import 'package:market/screens/page/cpupage.dart';
import 'package:market/screens/page/coolerpage.dart';
import 'package:market/screens/page/memorypage.dart';
import 'package:market/screens/page/storagepage.dart';
import 'package:market/screens/page/vgapage.dart';
import 'package:market/screens/page/psupage.dart';
import 'package:market/screens/page/casepage.dart';

class RakitanBaruPage extends StatefulWidget {
  @override
  _RakitanBaruPageState createState() => _RakitanBaruPageState();
}

class _RakitanBaruPageState extends State<RakitanBaruPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rakitan Baru',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
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
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'Nama Rakitan',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        hintText: 'Masukkan nama rakitan',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            buildCategory(context, 'Motherboard', MotherboardPage()),
            buildCategory(context, 'CPU', CpuPage()),
            buildCategory(context, 'CPU Cooler', CpuCoolerPage()),
            buildCategory(context, 'Memory', MemoryPage()),
            buildCategory(context, 'Storage', StoragePage()),
            buildCategory(context, 'Video Card', VideoCardPage()),
            buildCategory(context, 'Power Supply', PsuPage()),
            buildCategory(context, 'Case', CasePage()),
            buildTotalBiaya(),
            buildSimpanButton(),
          ],
        ),
      ),
    );
  }

  Widget buildCategory(BuildContext context, String categoryName, Widget page) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Center(
          child: Column(
            children: <Widget>[
              Text(
                categoryName,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
                },
                child: Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTotalBiaya() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Total Biaya',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSimpanButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(25.0),
        child: ElevatedButton(
          onPressed: () {
            // Aksi yang akan diambil ketika tombol disimpan diklik
            // Tempatkan logika penyimpanan atau perubahan lain yang sesuai
          },
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ),
    );
  }
}

