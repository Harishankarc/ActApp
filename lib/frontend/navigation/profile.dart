import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/auth/login.dart';
import 'package:actapp/frontend/auth/profileinfo1.dart';
import 'package:actapp/frontend/auth/resetpassword.dart';
import 'package:actapp/frontend/other/aboutus.dart';
import 'package:actapp/frontend/other/editprofile.dart';
import 'package:actapp/routetransitions.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:actapp/widgets/detailsbox.dart';
import 'package:actapp/widgets/gallerygroupbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isGalleryClicked = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: API.backcolor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: API.cardcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: 45,
                            height: 45,
                            color: Colors.black,
                          ),
                          // child: Image.asset(
                          //   'assets/images/profileavatar.png',
                          //   width: 40,
                          //   height: 40,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    AppText.subtitle('Nanditha N A'),
                    SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: API.appcolor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: AppText.verysmalltitle(
                        'Actress',
                        weight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    AppText.verysmalltitle(
                      'Golden Plan User',
                      color: API.appcolor,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        isGalleryClicked == true
                            ? Center(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: API.cardbg.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isGalleryClicked = false;
                                      });
                                    },
                                    child: Icon(Icons.arrow_back, size: 20),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isGalleryClicked = true;
                              });
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: API.appcolor,
                                  width: 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: AppText.smalltitle(
                                'Your Gallery',
                                weight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: isGalleryClicked == false
                  ? _buildOptionsGroup()
                  : _buildGallery(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallery() {
    int itemCount = 5;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: API.cardbg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SlidingSegmentedControlGallery(
            onClicked: (val) {
              setState(() {
                selectedIndex = val;
                print(val);
              });
            },
          ),
          if (selectedIndex == 0)
            _buildImagesGridView(itemCount)
          else if (selectedIndex == 1)
            _buildVideosGridView(itemCount),
        ],
      ),
    );
  }

  Widget _buildImagesGridView(int itemCount) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 32, color: Colors.black54),
                    SizedBox(height: 4),
                    Text(
                      "Add Image",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildVideosGridView(int itemCount) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 32, color: Colors.black54),
                    SizedBox(height: 4),
                    Text(
                      "Add Videos",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildOptionsGroup() {
    return Column(
      children: [
        _buildOptions(
          icon: LucideIcons.rotateCcwKey300,
          label: 'Reset Password',
          onTap: () {
            slideRightWidget(newPage: ResetPassword(), context: context);
          },
        ),
        SizedBox(height: 10),
        _buildOptions(
          icon: LucideIcons.squarePen300,
          label: 'Edit Profile',
          onTap: () {
            slideRightWidget(newPage: EditProfile(), context: context);

          },
        ),
        SizedBox(height: 10),
        _buildOptions(
          icon: LucideIcons.info300,
          label: 'About Us',
          onTap: () {
            slideRightWidget(newPage: AboutUs(), context: context);
          },
        ),
        SizedBox(height: 10),
        _buildOptions(
          icon: LucideIcons.power300,
          label: 'Logout',
          onTap: () {
            pushWidgetWhileRemove(newPage: Login(), context: context);
          },
        ),
      ],
    );
  }

  Widget _buildOptions({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
