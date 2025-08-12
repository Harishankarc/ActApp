import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';

class VerificationOtp extends StatefulWidget {
  const VerificationOtp({super.key});

  @override
  State<VerificationOtp> createState() => _VerificationOtpState();
}

class _VerificationOtpState extends State<VerificationOtp> {
  final _controllers = List.generate(4, (_) => TextEditingController());
  final _focusNodes = List.generate(4, (_) => FocusNode());

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
              child: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        title: AppText.subtitle("Verification OTP"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
              const SizedBox(height: 250, width: 300),
              const SizedBox(height: 20),
              AppText.smalltitle(
                "Please enter OTP shared in your phone",
                weight: FontWeight.w500,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AppTextFeild(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          hintText: '',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          onChanged: (value) => _onOtpChanged(value, index),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              AppText.smalltitle("Resend OTP", weight: FontWeight.w500,color: API.linkcolor,),
              const SizedBox(height: 100),
              AppButton(text: "Verify", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
