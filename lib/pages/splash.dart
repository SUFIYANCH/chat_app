import 'dart:async';

import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/shared/constants.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper/helper_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    gotoHome();
    getUserLoggedInStatus();
  }

  gotoHome() async {
    await Future.delayed(
        const Duration(seconds: 2),
        (() => nextScreenReplace(
            context, _isSignedIn ? const HomePage() : const LoginPage())));
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                "https://assets5.lottiefiles.com/packages/lf20_nhmiuj9f.json"),
            // Image(
            //   image: AssetImage("lib/assets/blood-removebg-preview.png"),
            // ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Chat App",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 51, 4, 82)),
            ),
          ],
        ),
      ),
    );
  }
}
