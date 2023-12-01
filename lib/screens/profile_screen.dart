import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController date = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void initState(){
    date.text=" ";
    super.initState();
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
            child: Form(
               child: Column(children:[
            _buildProfileTextField("Nickname"),
            SizedBox(height: 12), // Ruang antara input box "Nickname" dan "Gender"
            _buildProfileDropdown("Gender"),
            SizedBox(height: 12), // Ruang antara input box "Gender" dan "Birth Date"
            _buildProfileDate("Birth Date ", icon: Icons.calendar_today, onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(1985), 
                      lastDate: DateTime(2050)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 
                      setState(() {
                         date.text = formattedDate; 
                      });
                  }else{
                      print("Date is not selected");
                  }}),
            SizedBox(height: 12), // Ruang antara input box "Birth Date" dan "Address"
            _buildProfileTextField("Address"),
            SizedBox(height: 12), // Ruang antara input box "Address" dan "Email"
            _buildProfileTextField("Email"),
            SizedBox(height: 12), // Ruang antara input box "Email" dan "Phone Number"
            _buildProfileNumberField("Phone Number"),
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
      )],
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
  Widget _buildProfileNumberField(String label, {IconData? icon, Function()? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
        FilteringTextInputFormatter.digitsOnly

          ],
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
Widget _buildProfileDate(String label, {IconData? icon, Function()? onTap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          TextField(
            controller: date,
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