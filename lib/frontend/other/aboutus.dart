import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:actapp/widgets/notificationbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: API.backcolor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: (){
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
        title: AppText.subtitle("About Us"),
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
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: API.appcolor,
                          shape: BoxShape.circle,
                        ),
                        child: SizedBox()
                      ),
                      SizedBox(height: 20,),
                      AppText.smalltitle(weight: FontWeight.normal,'Casting text in cinema refers to the process of finding and selecting actors for roles in a movie, which happens during pre-production. Casting calls are used to solicit applications from actors who fit the specific requirements of a character or project. These calls often specify details like gender, age range, ethnicity, height, and any special skills or talents')
                      ,SizedBox(height: 10,),
                      AppText.smalltitle(weight: FontWeight.normal,'Casting text in cinema refers to the process of finding and selecting actors for roles in a movie, which happens during pre-production. Casting calls are used to solicit applications from actors who fit the specific requirements of a character or project. These calls often specify details like gender, age range, ethnicity, height, and any special skills or talents')
                      ,SizedBox(height: 10,),
                      AppText.smalltitle(weight: FontWeight.normal,'Casting text in cinema refers to the process of finding and selecting actors for roles in a movie, which happens during pre-production. Casting calls are used to solicit applications from actors who fit the specific requirements of a character or project. These calls often specify details like gender, age range, ethnicity, height, and any special skills or talents')

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
