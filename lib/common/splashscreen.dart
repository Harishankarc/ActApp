import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/auth/login.dart';
import 'package:actapp/routetransitions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      slideRightWidget(newPage: Login(), context: context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: API.appcolor,
        child: Image.asset(
          'assets/images/actlogo.png',
          width: 200,
        ),
      )
    );
  }
}