import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileInfo1 extends StatefulWidget {
  const ProfileInfo1({super.key});

  @override
  State<ProfileInfo1> createState() => _ProfileInfo1State();
}

class _ProfileInfo1State extends State<ProfileInfo1> {
  List<String> _selectedCategories = [];
  String? _selectedGender;
  String? _selectedCountryCode;
  bool isObsured = false;
  bool _isChecked = false;

  final List<String> categoriesList = [
    'Actor',
    'Actress',
    'Director',
    'Producer',
    'Writer',
    'Cinematographer',
    'Editor',
    'Composer',
    'Sound Designer',
    'Costume Designer',
    'Makeup Artist',
    'Stunt Coordinator',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: API.cardbg,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: API.cardbg.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.arrow_back, size: 20),
            ),
          ),
        ),
        title: AppText.subtitle("Profile Info"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [API.appcolor, API.subcolor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: SizedBox(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.smalltitle(
                            'First Name',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter First Name'),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Last Name',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          AppTextFeild(hintText: 'Enter Last Name'),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Email Id',
                                weight: FontWeight.normal,
                              ),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'Enter Email Id'),
                            ],
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Contact Number',
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: API.buildDropdown(
                                  items: ['+91'],
                                  hintText: '+91',
                                  selectedItem: _selectedCountryCode,
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: AppTextFeild(hintText: '0000000000'),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.smalltitle(
                                'Country geo loaction',
                                weight: FontWeight.normal,
                              ),
                              SizedBox(height: 5),
                              AppTextFeild(hintText: 'use your current location',prefixIcon: Icon(LucideIcons.locateFixed,size: 20,color: API.linkcolor,),),
                            ],
                          ),
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Password',
                            weight: FontWeight.normal,
                          ),
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
                          SizedBox(height: 10),
                          AppText.smalltitle(
                            'Confirm Password',
                            weight: FontWeight.normal,
                          ),
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
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Container(
                                    height: 12,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      color: API.appcolor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),

                                  const SizedBox(width: 6),

                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                              AppButton(
                                text: "Next",
                                onPressed: () {},
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
