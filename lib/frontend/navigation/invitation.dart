import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/invitationacceptbox.dart';
import 'package:actapp/widgets/invitationgroupbutton.dart';
import 'package:actapp/widgets/invitationpendingbox.dart';
import 'package:actapp/widgets/invitationrejectbox.dart';
import 'package:actapp/widgets/upcomingeventbox.dart';
import 'package:flutter/material.dart';

class Invitation extends StatefulWidget {
  const Invitation({super.key});

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
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
                  SlidingSegmentedControlInvitation(
                    onClicked: (val) {
                      setState(() {
                        selectedIndex = val;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  if (selectedIndex == 0) _buildInvitationAcceptBox(),
                  if (selectedIndex == 1) _buildInvitationRejectBox(),
                  if (selectedIndex == 2) _buildInvitationPendingButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvitationAcceptBox() {
    return InvitationAcceptBox(
      title: 'Star Production House',
      description: 'Contacting a interview for young actors',
      date: '02 October 2025',
      day: 'Friday',
    );
  }

  Widget _buildInvitationRejectBox() {
    return InvitationRejectBox(
      title: 'Star Production House',
      date: '02 October 2025',
      day: 'Friday',
    );
  }

  Widget _buildInvitationPendingButton() {
    return Column(
      children: [
        InvitationPendingBox(
          title: 'King Production House',
          description: 'Contacting a interview for young actors',
          date: '02 October 2025',
          day: 'Friday',
          isExpired: true
        ),
        SizedBox(height: 10,),
        InvitationPendingBox(
          title: 'Moon Star Production House',
          description: 'Contacting a interview for young actors',
          date: '02 October 2025',
          day: 'Friday',
          isExpired: false
        ),
      ],
    );
  }
}
