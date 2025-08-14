import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:actapp/widgets/pendinginvitationbox.dart';
import 'package:actapp/widgets/upcomingeventbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

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
              padding: const EdgeInsets.all(20),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black26,
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
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.smalltitle('Nanditha N A'),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AppText.verysmalltitle(
                              'Actress',
                              weight: FontWeight.normal,
                              size: 9,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 28,
                      ),
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '4',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: API.cardcolor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.smalltitle('Total number of visitors'),
                          AppText.subtitle('199'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AppText.subtitle('Upcoming interviews'),
                  SizedBox(height: 20),
                  UpcomingInterviewBox(
                    title: 'King Production House',
                    description: 'Contacting a interview for young actors',
                    date: '02 October 2025',
                    day: 'Friday',
                  ),
                  SizedBox(height: 20),
                  AppText.subtitle('Pending Invitation'),
                  SizedBox(height: 20),
                  PendingInvitationBox(
                    title: 'King Production House',
                    description: 'Contacting a interview for young actors',
                    date: '02 October 2025',
                    day: 'Friday',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
