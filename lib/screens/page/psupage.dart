import 'package:flutter/material.dart';
import 'dart:convert';

class PsuPage extends StatefulWidget {
  @override
  _PsuPageState createState() => _PsuPageState();
}

class _PsuPageState extends State<PsuPage> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> psuList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  void fetchDataFromAPI() {
    String apiResponse = '''
    [
      {"name": "PSU 1", "image": "https://example.com/psu1.jpg", "price": 800000.0},
      {"name": "PSU 2", "image": "https://example.com/psu2.jpg", "price": 1000000.0},
      {"name": "PSU 3", "image": "https://example.com/psu3.jpg", "price": 1200000.0}
    ]
    ''';

    List<dynamic> data = json.decode(apiResponse);
    List<Map<String, dynamic>> psuListFromAPI = List<Map<String, dynamic>>.from(data);

    setState(() {
      psuList = psuListFromAPI;
    });
  }

  void onSearchPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search PSU'),
          content: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                print('Searching for PSU: ${searchController.text}');
                // You can implement the search functionality here
                Navigator.of(context).pop();
              },
              child: Text('Search'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
            ),
            title: Text(
              'Pilih PSU',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: onSearchPressed,
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: psuList.length,
            itemBuilder: (context, index) {
              String imageUrl = psuList[index]['image'];
              String psuName = psuList[index]['name'];
              double psuPrice = psuList[index]['price'];

              return Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(psuName),
                    subtitle: Text('IDR ${psuPrice.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('Add PSU to cart');
                      },
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
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
      ),
    );
  }
}