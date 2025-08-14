import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';

class UpcomingInterviewBox extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final String day;
  const UpcomingInterviewBox({super.key, required this.title, required this.description, required this.date, required this.day});

  @override
  State<UpcomingInterviewBox> createState() => _UpcomingInterviewBoxState();
}

class _UpcomingInterviewBoxState extends State<UpcomingInterviewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.smalltitle(widget.title),
                AppText.verysmalltitle(
                  widget.description,
                  weight: FontWeight.normal,
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            decoration: BoxDecoration(
              color: API.appcolor.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.verysmalltitle(
                  widget.date,
                  weight: FontWeight.w600,
                ),
                AppText.verysmalltitle(widget.day, weight: FontWeight.w600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
