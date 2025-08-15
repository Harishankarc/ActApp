import 'package:actapp/backend/api.dart';
import 'package:actapp/common/splashscreen.dart';
import 'package:actapp/frontend/auth/login.dart';
import 'package:actapp/frontend/auth/profileinfo1.dart';
import 'package:actapp/frontend/auth/profileinfo2.dart';
import 'package:actapp/frontend/auth/profileinfo3.dart';
import 'package:actapp/frontend/auth/resetpassword.dart';
import 'package:actapp/frontend/auth/verificationotp.dart';
import 'package:actapp/frontend/auth/verificationotpemail.dart';
import 'package:actapp/frontend/navigation/dashboard.dart';
import 'package:actapp/frontend/other/aboutus.dart';
import 'package:actapp/frontend/other/addprofilepicture.dart';
import 'package:actapp/frontend/navigation/layout.dart';
import 'package:actapp/frontend/other/details.dart';
import 'package:actapp/frontend/other/editprofile.dart';
import 'package:actapp/frontend/other/notification.dart';
import 'package:actapp/frontend/other/upgradetopremium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            fontFamily: API.appfont2,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
