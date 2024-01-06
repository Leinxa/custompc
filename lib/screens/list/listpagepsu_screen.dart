import 'package:flutter/material.dart';
import 'package:market/model/psu.dart';
import 'package:market/screens/list/detail/detailpsu_screen.dart';
import 'package:market/screens/list/detail/detailitem_screen.dart';
import 'package:market/Network/api.dart';
import 'package:http/http.dart' as http;
import 'package:market/screens/list/detail/detailram_screen.dart';
import 'dart:convert';
import 'package:market/screens/list/listpage_screen.dart';
import 'package:market/screens/list/listpagecasing_screen.dart';
import 'package:market/screens/list/listpagecooler_screen.dart';
import 'package:market/screens/list/listpagemotherboard_screen.dart';
import 'package:market/screens/list/listpageram_screen.dart';
import 'package:market/screens/list/listpagestorage.dart';
import 'package:market/screens/list/listpagevga_screen.dart';
class ListPagepsu extends StatefulWidget {
  @override
  _ListPagepsuState createState() => _ListPagepsuState();
}

class _ListPagepsuState extends State<ListPagepsu> {
  int _currentIndex = 1;
  String selectedCategory = 'psu';
  final Network network = Network();

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Barang',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle the search action
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: selectedCategory,
            items: <String>[
              'cpu',
              'motherboard',
              'psu',
              'vga',
              'cooler',
              'casing',
              'ram',
              'storage',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              selectedCategory = value!;
              if (value=='cpu') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage())
                  );
              }else if (value=='ram') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPageRam())
                  );
              }else if (value=='storage') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPageStorage())
                  );
              }
              else if (value=='vga') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPagevga())
                  );
              }
              else if (value=='casing') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPagecasing())
                  );
              }
              else if (value=='cooler') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPagecooler())
                  );
              }
              else if (value=='motherboard') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPagemotherboard())
                  );
              }
            },
            hint: Text('Kategori'),
          ),
          Expanded(
            child: Container(
              height: 400, 
              child: FutureBuilder<Psu>(
                future: network.fetchPsu(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context,index){
                        Data currentData = snapshot.data!.data[index];
                        return Card(
                    child: ListTile(
                      leading: Image.network(currentData.imageUrl),
                      title: Text(currentData.name),
                      subtitle: Text('Rp: '+currentData.price.toString()),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBarangPsuPage(data: currentData,),
                          ),
                        );
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Handle the add action
                        },
                      ),
                    ),
                  );
                      }
                      );
                } return const CircularProgressIndicator();}
              ),
            ),
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
