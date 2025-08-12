import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: API.cardbg,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        title: AppText.subtitle("Reset Password"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              API.appcolor.withOpacity(0.1),
              API.cardcolor.withOpacity(0.5),
              API.cardcolor,
              API.cardcolor,
              API.cardcolor,
              API.cardcolor,
              API.cardcolor.withOpacity(0.5),
              API.appcolor.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            children: [
              Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(),
              ),
              SizedBox(height: 20),
              AppText.smalltitle(
                "Enter your email or phone number to",
                weight: FontWeight.w500,
              ),
              AppText.smalltitle("reset password", weight: FontWeight.w500),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.smalltitle('Email Id'),
                  SizedBox(height: 5),
                  AppTextFeild(hintText: 'Username@gmail.com'),
                ],
              ),
              SizedBox(height: 40),
              AppButton(text: "Sent", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
