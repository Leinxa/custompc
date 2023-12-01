import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: SignUp(),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final Color labelTextColor = Color(0xFF0077B6); // Color for label text

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
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: const Color.fromARGB(255, 0, 118, 182),
                ),
                labelText: 'Username',
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
                // Handle sign-up logic here
                final String password = passwordController.text;
                final String confirmPassword = confirmPasswordController.text;

                if (password == confirmPassword) {
                  // Passwords match, proceed with sign-up
                  // Add your sign-up logic here
                } else {
                  // Passwords don't match, show an error message
                  print('Passwords do not match');
                }
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
    );
  }
}

void main() {
  runApp(SignUpScreen());
}
