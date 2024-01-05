import 'package:flutter/material.dart';
import 'dart:convert';

class MemoryPage extends StatefulWidget {
  @override
  _MemoryPageState createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> memoryList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  void fetchDataFromAPI() {
    String apiResponse = '''
    [
      {"name": "Memory 1", "image": "https://example.com/memory1.jpg", "price": 500000.0},
      {"name": "Memory 2", "image": "https://example.com/memory2.jpg", "price": 600000.0},
      {"name": "Memory 3", "image": "https://example.com/memory3.jpg", "price": 700000.0}
    ]
    ''';

    List<dynamic> data = json.decode(apiResponse);
    List<Map<String, dynamic>> memoryListFromAPI = List<Map<String, dynamic>>.from(data);

    setState(() {
      memoryList = memoryListFromAPI;
    });
  }

  void onSearchPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Memory'),
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
                print('Searching for Memory: ${searchController.text}');
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
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Pilih Memory',
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
            itemCount: memoryList.length,
            itemBuilder: (context, index) {
              String imageUrl = memoryList[index]['image'];
              String memoryName = memoryList[index]['name'];
              double memoryPrice = memoryList[index]['price'];

              return Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(memoryName),
                    subtitle: Text('IDR ${memoryPrice.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('Add Memory to cart');
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
