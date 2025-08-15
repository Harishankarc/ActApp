import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/auth/profileinfo1.dart';
import 'package:actapp/frontend/auth/verificationotp.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObsured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: API.appcolor,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [API.appcolor, API.subcolor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: API.cardcolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppText.subtitle('Enter Your Login Information'),
                          SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Email Id'),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Username@gmail.com'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle('Password'),
                              SizedBox(height: 5),
                              AppTextFeild(
                                hintText: '***********',
                                obscureText: isObsured ? true : false,
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isObsured = !isObsured;
                                      HapticFeedback.lightImpact();
                                    });
                                  },
                                  child: isObsured
                                      ? Icon(LucideIcons.eyeOff, size: 20)
                                      : Icon(LucideIcons.eye, size: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AppText.smalltitle('Forgot Password'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          AppButton(text: "Login", onPressed: () {
                            slideRightWidget(newPage: VerificationOtp(), context: context);
                          }),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.smalltitle('Dont have an account?'),
                              SizedBox(width: 5,),
                              AppText.smalltitle('Sign Up',color: API.subcolor,),

                            ],
                          ),
                          SizedBox(height: 100),
                          AppText.verysmalltitle(
                            'I agree to the terms of service and privacy policy',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.2,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: AppText.heading(
                    'Login',
                    size: 28,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
