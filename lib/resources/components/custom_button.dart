import 'package:flutter/material.dart';

import '../color/custom_color.dart';
import '../text/custom_textStyle.dart';

Widget customButton({
  bool? isLoading = false,
  required String buttonText,
  required Function()? onPressed,
  double? height,
  double? width,
  required double buttonTextSize,
  Color? btnColor,
  Color? textColor,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: customText(buttonText, textColor ?? white, buttonTextSize),
          ),
  );
}

Widget customTextButton({
  bool? isLoading = false,
  required String buttonText,
  required Function()? onPressed,
  double? height,
  double? width,
  required double buttonTextSize,
  Color? btnColor,
  Color? textColor,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: customText(buttonText, textColor ?? white, buttonTextSize),
          ),
  );
}
