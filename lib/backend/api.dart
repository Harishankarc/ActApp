// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  static Color appcolor = const Color(0xFFFFD539);
  static Color subcolor = Color.fromARGB(255, 254, 144, 1);
  static Color backcolor = const Color(0xfff6f7fe);
  static Color textcolor = Colors.black;
  static Color linkcolor = Colors.blue;
  static Color whitetextcolor = Colors.white;
  static Color bordercolor = Color(0xFF09255d);
  static Color buttoncolor = Color(0xFF09255d);
  static Color cardbg = const Color.fromARGB(255, 230, 230, 230);
  static Color cardcolor = Colors.white;
  static String appfont = 'Roboto';
  static String appfont2 = 'Dutch801BT';

  static Color color1 = const Color(0xFF1F87E3);
  static Color color2 = const Color(0xFFCC3079);
  static Color color3 = const Color(0xFFEDEDED);
  static Color color4 = const Color(0xFFFC6666);
  static Color color5 = const Color(0xFF2FC156);
  static Color color6 = const Color(0xFFFEA701);
  static Color color7 = const Color(0xFFAAB223);
  static Color color8 = const Color(0xFFF44336);

  static Color backgroundcolor = Colors.white;

  static Color buttonbordercolor = Colors.black;

  static String baseurl = "";

  static Color appbarcolor = const Color(0xFF17009f);

  static String formatDate(String dateString) {
    // Parse the date string using DateFormat
    DateTime date = DateFormat('yyyy-M-d').parse(dateString);

    // Format the date as 'dd / MM / yyyy'
    String formattedDate = DateFormat('dd / MM / yyyy').format(date);

    return formattedDate;
  }

  static Future<bool> checkInternetAvailable() async {
    // Step 1: Check if connected to any network
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == [ConnectivityResult.none]) {
      return false; // No network
    }

    // Step 2: Check actual internet access
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true; // Internet is available
      }
      return false;
    } on SocketException catch (_) {
      return false; // DNS failed, no internet
    }
  }

  static Future<Map<String, dynamic>> storeDataInSharedPrefs(
    Map<String, dynamic> companySettings,
  ) async {
    print("This is the company details");
    print(companySettings);
    final SharedPreferences zephyrerpcache =
        await SharedPreferences.getInstance();
    companySettings.forEach((key, value) {
      print(value);
      if (value is String) {
        zephyrerpcache.setString(key, value);
      } else if (value is int) {
        zephyrerpcache.setInt(key, value);
      } else if (value is double) {
        zephyrerpcache.setDouble(key, value);
      } else if (value is bool) {
        zephyrerpcache.setBool(key, value);
      }
    });
    return {"status": "success", "data": true};
  }

  static Future<dynamic> getDataFromSharedPrefs(String key) async {
    final SharedPreferences zephyrerpcache =
        await SharedPreferences.getInstance();
    if (zephyrerpcache.containsKey(key)) {
      return zephyrerpcache.get(key);
    } else {
      return "";
    }
  }

  static TextStyle textStyleType() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    );
  }

  static void showDefaultSnackbar(
    BuildContext context,
    String type,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: type == 'success' ? Colors.green : Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static TextStyle textCustomStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle textCustomSnackStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle textDashboardHeadingStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    );
  }

  static Widget loadingScreen() {
    return const Center(
      child: SizedBox(
        height: 50,
        child: SpinKitChasingDots(color: Colors.white, size: 40.0),
      ),
    );
  }

  static Future<void> shareFileFromUrl(
    String fileUrl, {
    String? fileName,
  }) async {
    try {
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final name = fileName ?? fileUrl.split('/').last;
      final filePath = '${tempDir.path}/$name';

      await dio.download(
        fileUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      final file = File(filePath);
      if (await file.exists()) {
        await Share.shareXFiles([
          XFile(file.path),
        ], text: 'Check out this file!');
      } else {
        print('Downloaded file not found.');
      }
    } catch (e) {
      print('Error sharing file: $e');
    }
  }

  static void showSnackBar(String status, String message) {
    if (status == "success") {
      Get.snackbar(
        "Great",
        message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Note",
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  static Widget buildDropdown<T>({
    required List<T> items,
    required T? selectedItem,
    required ValueChanged<T?> onChanged,
    String hintText = 'Select',
    double width = double.infinity,
    double height = 50,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 12,
    ),
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          hint: Text(
            hintText,
            style:  TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400),
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Text(
                    item.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              )
              .toList(),
          value: selectedItem,
          onChanged: onChanged,
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.only(left: 0,right: 10, top: 12,bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(style: BorderStyle.none),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(height: 40),
        ),
      ),
    );
  }

  static Widget buildMultiSelect<T>({
    required List<T> items,
    required List<T> selectedItems,
    required Function(List<T>) onConfirm,
    String hintText = 'Select',
  }) {
    return Theme(
      data: ThemeData(
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
      child: MultiSelectDialogField<T>(
        items: items
            .map((item) => MultiSelectItem<T>(item, item.toString()))
            .toList(),
        listType: MultiSelectListType.LIST,
        initialValue: selectedItems,
        selectedColor: Colors.green.shade600,
        title: Text(hintText,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        buttonIcon: Icon(Icons.arrow_drop_down_outlined, color: Colors.grey.shade600),
        buttonText: Text(
          hintText,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        onConfirm: onConfirm,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(style: BorderStyle.none),
        ),
        chipDisplay: MultiSelectChipDisplay(
          chipColor: Colors.grey.shade200,
          textStyle: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ),
    );
  }

}
