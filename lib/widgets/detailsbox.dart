import 'package:actapp/backend/api.dart';
import 'package:actapp/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class DetailsBox extends StatelessWidget {
  final String title;
  final String description;
  final String location;
  final String date;
  final String mode;
  final VoidCallback? onReject;
  final VoidCallback? onConfirm;
  const DetailsBox({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.onReject,
    this.onConfirm,
    required this.location,
    required this.mode,
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
                    AppText.smalltitle(title, weight: FontWeight.bold),
                    AppText.verysmalltitle(
                      description,
                      weight: FontWeight.normal,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.mapPin300,
                          color: Colors.black,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        AppText.verysmalltitle(
                          location,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    AppText.verysmalltitle(
                      date,
                      weight: FontWeight.w600,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        AppText.verysmalltitle(
                          'Mode : ',
                          weight: FontWeight.w600,
                        ),
                        AppText.verysmalltitle(
                          mode,
                          weight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
