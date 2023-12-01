import 'package:flutter/material.dart';
import 'package:market/screens/signin_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInScreen()), (route) => false);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 118, 182),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MyLaptop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.1, // Contoh: 10% dari lebar layar
                  fontFamily: 'Sans Serif Collection',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                "assets/images/laptop_splsh.png",
                width: MediaQuery.of(context).size.width * 0.5, // Contoh: 50% dari lebar layar
              ),
            ],
          ),
        ),
      ),
    );
  }
}