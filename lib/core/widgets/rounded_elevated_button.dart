import 'package:appwrite_bloc_todo/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  final Color color;

  const RoundedElevatedButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.color = AppColor.appBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        elevation: const MaterialStatePropertyAll(0),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(MediaQuery.sizeOf(context).width, 45),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: AppColor.appColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
