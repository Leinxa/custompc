import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:market/screens/homepage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:market/Network/api.dart';
import 'dart:convert';
import 'package:market/screens/profile_screen.dart';
import 'package:market/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isAuth = false;

  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }
  bool visible=false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String getEmail(){
    return usernameController.text.toString();
  }
  String getpassword(){
    return passwordController.text.toString();
  }
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith( // Ganti ThemeData.dark() dengan ThemeData.light()
        scaffoldBackgroundColor: Colors.white, // Ganti dengan warna putih
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
              'Sign In',
              style: TextStyle(
                color: Color(0xFF0077B6),
                fontSize: 32,
                fontFamily: 'Sans Serif Collection',
                fontWeight: FontWeight.w400,
              ),
            ),
            Image.asset('assets/images/laptop_splsh.png',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xFF0077B6),
                ),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Color(0xFF0077B6),
                ),
                enabledBorder: OutlineInputBorder( // Mengganti border
                  borderSide: BorderSide(
                    color: Colors.black, // Ganti dengan warna hitam
                  ),
                ),
                focusedBorder: OutlineInputBorder( // Mengganti border saat terfokus
                  borderSide: BorderSide(
                    color: Color(0xFF0077B6),
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
                  color: Color(0xFF0077B6),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xFF0077B6),
                ),
                enabledBorder: OutlineInputBorder( // Mengganti border
                  borderSide: BorderSide(
                    color: Colors.black, // Ganti dengan warna hitam
                  ),
                ),
                focusedBorder: OutlineInputBorder( // Mengganti border saat terfokus
                  borderSide: BorderSide(
                    color: Color(0xFF0077B6),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0077B6),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Navigate to registration screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                'Don’t have an account? Register Here',
                style: TextStyle(
                  color: Color(0xFF0077B6),
                  fontSize: 12,
                  fontFamily: 'Sans Serif Collection',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
  
void _login() async{
    var data = {
      'email' : getEmail(),
      'password' : getpassword()
    };

    var res = await Network().auth(data, '/login');
    var body = json.decode(res.body);
    print(body);
    if(body['status']==200){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
       Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage())
                  );
      ;
  }
}
void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
          if (isAuth = true) {
            Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
          }
        });
      }
    }
  }
}