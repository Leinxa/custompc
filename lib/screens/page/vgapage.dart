import 'package:flutter/material.dart';
import 'dart:convert';

class VideoCardPage extends StatefulWidget {
  @override
  _VideoCardPageState createState() => _VideoCardPageState();
}

class _VideoCardPageState extends State<VideoCardPage> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> videoCardList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  void fetchDataFromAPI() {
    String apiResponse = '''
    [
      {"name": "Video Card 1", "image": "https://example.com/videocard1.jpg", "price": 8000000.0},
      {"name": "Video Card 2", "image": "https://example.com/videocard2.jpg", "price": 10000000.0},
      {"name": "Video Card 3", "image": "https://example.com/videocard3.jpg", "price": 12000000.0}
    ]
    ''';

    List<dynamic> data = json.decode(apiResponse);
    List<Map<String, dynamic>> videoCardListFromAPI = List<Map<String, dynamic>>.from(data);

    setState(() {
      videoCardList = videoCardListFromAPI;
    });
  }

  void onSearchPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Video Card'),
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
                print('Searching for Video Card: ${searchController.text}');
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
              'Pilih Video Card',
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
            itemCount: videoCardList.length,
            itemBuilder: (context, index) {
              String imageUrl = videoCardList[index]['image'];
              String videoCardName = videoCardList[index]['name'];
              double videoCardPrice = videoCardList[index]['price'];

              return Column(
                children: [
                  ListTile(
                    leading: Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(videoCardName),
                    subtitle: Text('IDR ${videoCardPrice.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print('Add Video Card to cart');
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
