import 'package:flutter/material.dart';
import 'package:market/screens/signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith( // Ganti ThemeData.dark() dengan ThemeData.light()
        scaffoldBackgroundColor: Colors.white, // Ganti dengan warna putih
      ),
      home: Scaffold(
        body: SignIn(),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                // Handle sign-in logic here
                final String username = usernameController.text;
                final String password = passwordController.text;

                if (username == 'contohuser' && password == 'contohpassword') {
                  // Sign-in berhasil
                  print('Sign-in berhasil');
                } else {
                  // Sign-in gagal
                  print('Sign-in gagal');
                }
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
    );
  }
}
