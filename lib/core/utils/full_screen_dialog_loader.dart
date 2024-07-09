import 'package:appwrite_bloc_todo/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FullScreenDialogLoader {
  static bool _isDialogOpen = false;

  static void show(BuildContext context) {
    if (!_isDialogOpen) {
      _isDialogOpen = true;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              barrierColor: AppColor.transparentColor,
              builder: (BuildContext context) {
                return const PopScope(
                  canPop: false,
                  child: Center(
                    child: SpinKitCircle(
                      color: AppColor.appBarColor,
                      size: 80,
                    ),
                  ),
                );
              },
            ).then((_) {
              _isDialogOpen = false;
            });
          }
        },
      );
    }
  }
}


https://www.youtube.com/watch?v=xP5kjxCRfYs
7:45