import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appButton.dart';
import 'package:actapp/widgets/appCheckBox.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:actapp/widgets/appTextFeild.dart';
import 'package:actapp/widgets/detailsbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: API.backcolor,
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
        title: AppText.subtitle("Details"),
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: DetailsBox(
                title: 'Star Production House',
                description: 'Contacting a interview for young actors',
                location: 'Aluva, Kochi, Kerala, India',
                mode: 'Online',
                date: '21 August 2025 Friday 08:30 Am',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
