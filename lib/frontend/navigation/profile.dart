import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:actapp/widgets/detailsbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              height: 300,
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
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: API.appcolor, width: 1),
                      ),
                      alignment: Alignment.center,
                      child: AppText.smalltitle(
                        'Your Gallery',
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildOptions(
                    icon: LucideIcons.rotateCcwKey300,
                    label: 'Reset Password',
                    onTap: () {},
                  ),
                  SizedBox(height: 10,),
                  _buildOptions(
                    icon: LucideIcons.squarePen300,
                    label: 'Edit Profile',
                    onTap: () {},
                  ),
                  SizedBox(height: 10,),
                  _buildOptions(
                    icon: LucideIcons.info300,
                    label: 'About Us',
                    onTap: () {},
                  ),
                  SizedBox(height: 10,),
                  _buildOptions(
                    icon: LucideIcons.power300,
                    label: 'Logout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
