import 'package:flutter/material.dart';
import 'package:market/screens/detailitem_screen.dart';
import 'package:market/Network/api.dart';
import 'package:market/model/cpu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _currentIndex = 0;
  late Future<Cpu> futureCpu;

@override
  void initState() {
    super.initState();
    futureCpu = fetchcpu();
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
            items: <String>[
              'cpu',
              'Kategori 2',
              'Kategori 3',
              'Kategori 4'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {
              // Handle category change
            },
            hint: Text('Kategori'),
          ),
          Expanded(
            child: Container(
              height: 400, 
              child: FutureBuilder<Cpu>(
                future: futureCpu,
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.image,
                        size: 36, // Set the desired size
                      ),
                      title: Text('Nama Barang'),
                      subtitle: Text('Rp 000.000,00'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBarangPage(),
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

Future<Cpu> fetchcpu() async{
  var res = await http
      .get(Uri.parse('http://10.0.2.2:8000/api/list/cpu'));;
  if (res.statusCode == 200) {
  return Cpu.fromJson(jsonDecode(res.body));
} else {
  throw Exception('Failed to load data');
}
}
