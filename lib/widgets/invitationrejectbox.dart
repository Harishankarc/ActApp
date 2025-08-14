import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';

class InvitationRejectBox extends StatefulWidget {
  final String title;
  final String date;
  final String day;
  const InvitationRejectBox({
    super.key,
    required this.title,
    required this.date,
    required this.day,
  });

  @override
  State<InvitationRejectBox> createState() => _InvitationRejectBoxState();
}

class _InvitationRejectBoxState extends State<InvitationRejectBox> {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.subtitle(widget.title),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.verysmalltitle(widget.date, weight: FontWeight.w600),
                AppText.verysmalltitle(widget.day, weight: FontWeight.w600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
