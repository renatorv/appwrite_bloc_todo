import 'package:appwrite_bloc_todo/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(context, message, AppColor.snackBarGreen);
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackbar(context, message, AppColor.snackBarBlue);
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(context, message, AppColor.snackBarRed);
  }

  static void _showSnackbar(BuildContext context, String message, Color color) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColor.whiteColor,
                ),
          ),
          backgroundColor: color,
        ),
      );
    });
  }
}
