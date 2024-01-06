import 'package:flutter/material.dart';
import 'package:market/screens/keranjang_screen.dart';
import 'package:market/screens/list/listpage_screen.dart';
import 'package:market/screens/rakitanpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:market/screens/signin_screen.dart';
import 'menuprofile_screen.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAuth = false;
  int _currentIndex = 0;
  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyPC'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                color: Colors.blue,
                text: 'Daftar Barang',
                icon: Icons.inventory,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Rakit PC',
                icon: Icons.build,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RakitanPage()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Keranjang',
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KeranjangPage()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Profile',
                icon: Icons.account_circle,
                onTap: () {
                  // Tambahkan aksi ketika kotak keempat ditekan
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuProfile()));
                },
              ),
            ],
          ),
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
    );
  }
    void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token == null){
        setState(() {
          isAuth = false;
          if (isAuth = false) {
            Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
          }
        });
    }
  }
  void _onItemTapped(int index) {
    setState(() {
    });
    // Sesuaikan aksi sesuai kebutuhan Anda
  }
}

class CustomButton extends StatefulWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function onTap;

  CustomButton({
    required this.color,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          scaleFactor = 0.95;
        });
      },
      onTapUp: (_) {
        setState(() {
          scaleFactor = 1.0;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          scaleFactor = 1.0;
        });
      },
      child: Transform.scale(
        scale: scaleFactor,
        child: Container(
          width: 286,
          height: 93,
          color: widget.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 36,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
