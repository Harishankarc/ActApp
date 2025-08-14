import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';

class InvitationPendingBox extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String day;
  final bool isExpired;
  final VoidCallback? onReject;
  final VoidCallback? onConfirm;
  const InvitationPendingBox({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.day,
    this.onReject,
    this.onConfirm,
    required this.isExpired,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.smalltitle(title),
                    AppText.verysmalltitle(
                      description,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                child: Container(
                  width: 115,
                  height: 65,
                  decoration: BoxDecoration(
                    color: API.appcolor.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText.verysmalltitle(
                        date,
                        weight: FontWeight.w600,
                      ),
                      AppText.verysmalltitle(day, weight: FontWeight.w600),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: !isExpired ? Row(
              children: [
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: AppText.smalltitle(
                      'Reject',
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: API.appcolor, // Yellow
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: AppText.smalltitle(
                      'Accept',
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.smalltitle('Expired',weight: FontWeight.w600,color: Colors.red,),
              ],
            )
          ),
        ],
      ),
    );
  }
}
