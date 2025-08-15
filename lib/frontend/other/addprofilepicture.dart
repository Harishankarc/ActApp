import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/other/upgradetopremium.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AddProfilePicture extends StatefulWidget {
  const AddProfilePicture({super.key});

  @override
  State<AddProfilePicture> createState() => _AddProfilePictureState();
}

class _AddProfilePictureState extends State<AddProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppText.subtitle("Add Profile Picture *"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
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
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 100, bottom: 70),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [API.appcolor, API.subcolor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: API.cardcolor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: API.cardbg,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    AppText.subtitle("Upload Photos"),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 3) {
                                return Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: API.cardcolor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                        AppText.verysmalltitle(
                                          'Add',
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: API.cardcolor,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            size: 30,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: -5,
                                        right: -5,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: API.cardbg,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.subtitle("Upload Video"),
                      SizedBox(height: 10),
                      DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: Radius.circular(15),
                          dashPattern: [4, 4],
                          strokeWidth: 1,
                          color: Colors.grey.shade400,
                        ),
                        childOnTop: false,
                        child: Container(
                          height: 80,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                LucideIcons.upload,
                                size: 24,
                                color: Colors.black,
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText.verysmalltitle(
                                    'Introductory Video',
                                    color: Colors.black87,
                                    weight: FontWeight.normal,
                                  ),
                                  SizedBox(width: 5),
                                  AppText.verysmalltitle(
                                    '*',
                                    color: Colors.red,
                                    weight: FontWeight.normal,
                                  ),
                                ],
                              ),
                              AppText.verysmalltitle(
                                'Less than 1 Mt',
                                color: Colors.black87,
                                weight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      AppText.verysmalltitle(
                        "Upload performance video (less than 2 minutes)",
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == 3) {
                                  return Container(
                                    height: 60,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: API.cardbg,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                          AppText.verysmalltitle(
                                            'Add',
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Container(
                                      height: 60,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: API.cardbg,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          LucideIcons.upload,
                                          size: 20,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppText.subtitle("Upload Audio Files"),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                if (index == 3) {
                                  return Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: API.cardbg,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                          AppText.verysmalltitle(
                                            'Add',
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: API.cardbg,
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              LucideIcons.music,
                                              size: 30,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -5,
                                          right: -5,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100),
                      AppButton(
                        text: 'Start',
                        height: 50,
                        width: double.infinity,
                        borderRadius: 10,
                        onPressed: () {
                          slideRightWidget(
                            newPage: UpdrageToPremium(),
                            context: context,
                          );
                        },
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

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
