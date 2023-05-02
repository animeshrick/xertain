import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text/custom_textStyle.dart';

Widget customTextField(
    {String? labelText,
    String? hintText,
    required String? Function(String?)? validator,
    required TextEditingController? controller,
    bool? isPhoneField,
    Function(String)? onChanged,
    bool obscureText = false,
    bool? isLast,
    bool? isSearch,
    bool? isEnable = true,
    TextInputType? keyboardType,
    int? maxLength,
    bool isAutoFocus = false}) {
  return
      // Platform.isAndroid?
      TextFormField(
    // initialValue: 'd',
    inputFormatters: isPhoneField == true
        ? [
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
            LengthLimitingTextInputFormatter(10),
          ]
        : [],
    maxLength: maxLength,
    autofocus: isAutoFocus,
    obscureText: obscureText,
    enabled: isEnable,
    decoration: isPhoneField == true
        ? InputDecoration(
            labelText: labelText,
            prefixText: '+91',
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          )
        : isSearch == true
            ? InputDecoration(
                labelText: labelText,
                hintText: hintText,
                hintStyle: customizeTextStyle(FontWeight.w300, 12.0, Colors.black),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
              )
            : InputDecoration(
                labelText: labelText,
                hintText: hintText,
              ),
    controller: controller,
    validator: validator,
    onChanged: onChanged,
    textInputAction:
        isLast == true ? TextInputAction.done : TextInputAction.next,
    keyboardType: keyboardType,
  );
  // : CupertinoTextField(
  //     controller: controller,
  //     obscureText: obscureText,
  //     decoration: BoxDecoration(),
  //   );
}

Widget customTextField2(
    {String? labelText,
    String? initialValue,
    // String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputType? keyboardType,
    bool isAutoFocus = false}) {
  return TextFormField(
    initialValue: initialValue,
    decoration: InputDecoration(
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 0.0),
      ),
    ),
    // validator: validator,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
  );
}
