import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rakit PC',
      home: Scaffold(
        appBar: AppBar(
          title: Text('RAKIT PC'),
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
                  // Tambahkan aksi ketika kotak pertama ditekan
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanTujuan()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Rakit PC',
                icon: Icons.build,
                onTap: () {
                  // Tambahkan aksi ketika kotak kedua ditekan
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanTujuan()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Keranjang',
                icon: Icons.shopping_cart,
                onTap: () {
                  // Tambahkan aksi ketika kotak ketiga ditekan
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanTujuan()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                color: Colors.blue,
                text: 'Profile',
                icon: Icons.account_circle,
                onTap: () {
                  // Tambahkan aksi ketika kotak keempat ditekan
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanTujuan()));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue, // Ganti warna sesuai keinginan Anda
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  iconSize: 35,
                  onPressed: () {
                    // Aksi saat tombol Home ditekan
                    _onItemTapped(0);
                  },
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.inventory, color: Colors.white),
                    iconSize: 35,
                    onPressed: () {
                      // Aksi saat tombol Daftar Barang ditekan
                      _onItemTapped(1);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.build, color: Colors.white),
                    iconSize: 35,
                    onPressed: () {
                      // Aksi saat tombol Rakit PC ditekan
                      _onItemTapped(2);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    iconSize: 35,
                    onPressed: () {
                      // Aksi saat tombol Keranjang ditekan
                      _onItemTapped(3);
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.account_circle, color: Colors.white),
                    iconSize: 42,
                    onPressed: () {
                      // Aksi saat tombol Profile ditekan
                      _onItemTapped(4);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
