import 'package:flutter/material.dart';

void main() {
  runApp(RakitanLamaPage());
}

class RakitanLamaPage extends StatefulWidget {
  @override
  _RakitanLamaPageState createState() => _RakitanLamaPageState();
}

class _RakitanLamaPageState extends State<RakitanLamaPage> {
  int _currentIndex = 2;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Rakitan Sebelumnya',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nama Rakitan',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedValue,
                        items: <String>[
                          'Pilihan 1 yang sangat panjang',
                          'Pilihan 2',
                          'Pilihan 3 yang sangat sangat panjang',
                          'Pilihan 4',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        hint: Text('Pilih salah satu'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Bagian Motherboard
                buildListComponent(
                  componentName: 'Motherboard',
                  harga: 'Rp 1.000.000',
                  placeholderImage: 'assets/motherboard_placeholder.png',
                  isFirstComponent: true,
                ),

                // Bagian CPU
                buildListComponent(
                  componentName: 'CPU',
                  harga: 'Rp 800.000',
                  placeholderImage: 'assets/cpu_placeholder.png',
                ),

                // Bagian CPU Cooler
                buildListComponent(
                  componentName: 'CPU Cooler',
                  harga: 'Rp 200.000',
                  placeholderImage: 'assets/cpu_cooler_placeholder.png',
                ),

                // Bagian Memory
                buildListComponent(
                  componentName: 'Memory',
                  harga: 'Rp 500.000',
                  placeholderImage: 'assets/memory_placeholder.png',
                ),

                // Bagian Storage
                buildListComponent(
                  componentName: 'Storage',
                  harga: 'Rp 300.000',
                  placeholderImage: 'assets/storage_placeholder.png',
                ),

                // Bagian Video Card
                buildListComponent(
                  componentName: 'Video Card',
                  harga: 'Rp 1.500.000',
                  placeholderImage: 'assets/video_card_placeholder.png',
                ),

                // Bagian Power Supply
                buildListComponent(
                  componentName: 'Power Supply',
                  harga: 'Rp 400.000',
                  placeholderImage: 'assets/power_supply_placeholder.png',
                ),

                // Bagian Case
                buildListComponent(
                  componentName: 'Case',
                  harga: 'Rp 600.000',
                  placeholderImage: 'assets/case_placeholder.png',
                ),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Biaya',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 215,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk tombol Simpan
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Simpan'),
                ),
              ],
            ),
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

  Widget buildListComponent({
    required String componentName,
    required String harga,
    required String placeholderImage,
    bool isFirstComponent = false,
  }) {
    return Column(
      children: [
        // Garis atas jika bukan komponen pertama
        if (!isFirstComponent) Divider(),

        // Bagian teks komponen
        Text(
          componentName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        // Garis di antara teks dan gambar
        Divider(),

        // Bagian isi komponen
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Barang'),
                Text(harga, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk tombol Ganti
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Ganti'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk tombol Hapus
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Hapus'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
