import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import '../constants/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';

class Helper {
  // Regex
  static RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static RegExp phoneRegex = RegExp(
    r'^[0-9]{10}$',
  );

  // Convert date to formatted date
  static String convertToFormattedDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);

    String formattedDate = DateFormat('dd/MM/yy').format(dateTime);

    return formattedDate;
  }

  // Title case
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  // Extract file name
  static String extractName(String path) {
    String fileName = p.basename(path);

    // String name = p.basenameWithoutExtension(fileName);

    return fileName;
  }

  // Check if dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // SnackBar
  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Theme.of(context).snackBarTheme.contentTextStyle,
      ),
    ));
  }

  // Show dialog
  static void showDialog(
      String title, String content, Function func, BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Are you sure?",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.primary,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 10),
            child: Text(
              "Do you want to logout",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.white
                        : AppColors.black,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            CupertinoDialogAction(
              onPressed: () async {
                func();
              },
              child: Text(
                "OK",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        );
      },
    );
  }

  // Show Permission dialog
  static void showPermissionDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Storage Permission Required',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.start,
            ),
          ),
          content: Text(
            'This app needs storage permission to function properly. Please grant the permission from app settings.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.start,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            TextButton(
              child: Text('Open Settings',
                  style: Theme.of(context).textTheme.bodyMedium),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  // Show Progress Dialog
  static void showProgressDialog(BuildContext context, String title) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  backgroundColor: AppColors.secondary,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 4,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Show Cirular Progress Indicator
  static void showCircularProgressIndicator(BuildContext context) {
    Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.secondary,
        strokeCap: StrokeCap.round,
        strokeWidth: 4,
      ),
    );
  }
}
