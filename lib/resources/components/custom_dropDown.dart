import 'package:flutter/material.dart';

import '../color/custom_color.dart';
import '../text/custom_textStyle.dart';

Widget customDropDown({
  required String value,
  required List<DropdownMenuItem<String>>? items,
  required Function(String?) onChanged,
  required bool isLanguage,
  String hintText = '',
}) {
  return isLanguage == true
      ? Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: black,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Icon(Icons.public),
              ),
              DropdownButton<String>(
                value: value,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: const SizedBox(),
                onChanged: onChanged,
                items: items,
              ),
            ],
          ),
        )
      : DropdownButton<String>(
          hint: customText(hintText, black, 16),
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          isExpanded: true,
          style: const TextStyle(color: Colors.deepPurple),
          // underline: const SizedBox(),
          onChanged: onChanged,
          items: items,
        );
}
