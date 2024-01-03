import 'package:flutter/material.dart';
import 'package:market/Network/api.dart';
import 'package:market/screens/profile_screen.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final Color labelTextColor = Color(0xFF0077B6); // Color for label text

  String getEmail(){
    return emailController.text.toString();
  }

  String getPassword(){
    if (passwordController.text == confirmPasswordController.text) {
      return passwordController.text.toString();
    }else{
      return "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
      child: Container(
        width: 360,
        height: 640,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                color: Color(0xFF0077B6),
                fontSize: 32,
                fontFamily: 'Sans Serif Collection',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Create your account',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontFamily: 'Sans Serif Collection',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 60),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: const Color.fromARGB(255, 0, 118, 182),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: labelTextColor, // Use the labelTextColor
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                 color: const Color.fromARGB(255, 0, 118, 182),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: labelTextColor, // Use the labelTextColor
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: const Color.fromARGB(255, 0, 118, 182),
                ),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: labelTextColor, // Use the labelTextColor
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _SignUp();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0077B6),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            
          ],
        ),
      ),
    )));
  }
  void _SignUp() async{
    var data = {
      'email' : getEmail(),
      'password': getPassword()
    };
    var res = await Network().auth(data, '/register');
    var body = json.decode(res.body);
    print(body);
    if(body['status']==200){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.decode(body['token']));
      localStorage.setString('user', json.encode(body['user_id']));
       Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen())
                  );
  }
  }
}