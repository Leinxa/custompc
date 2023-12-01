import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Profile(),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? selectedGender;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 253,
            color: Color(0xFF0077B6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Sans Serif Collection',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Change Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Sans Serif Collection',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 19), // Tambahkan ruang di sini
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
               children: [
            _buildProfileTextField("Nickname"),
            SizedBox(height: 12), // Ruang antara input box "Nickname" dan "Gender"
            _buildProfileDropdown("Gender"),
            SizedBox(height: 12), // Ruang antara input box "Gender" dan "Birth Date"
            _buildProfileTextField("Birth Date", icon: Icons.calendar_today, onTap: () => _selectDate(context)),
            SizedBox(height: 12), // Ruang antara input box "Birth Date" dan "Address"
            _buildProfileTextField("Address"),
            SizedBox(height: 12), // Ruang antara input box "Address" dan "Email"
            _buildProfileTextField("Email"),
            SizedBox(height: 12), // Ruang antara input box "Email" dan "Phone Number"
            _buildProfileTextField("Phone Number"),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle submit button click
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTextField(String label, {IconData? icon, Function()? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: label,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            readOnly: onTap != null,
            onTap: onTap,
        ),
          if (icon != null)
            Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: onTap,
                child: Icon(icon),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProfileDropdown(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        value: selectedGender,
        onChanged: (String? newValue) {
          setState(() {
            selectedGender = newValue;
          });
        },
        items: <String>['Male', 'Female'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}