import 'package:flutter/material.dart';

TextStyle customizeTextStyle(fontWeight, fontSize, fontColor) => TextStyle(
    fontWeight: fontWeight,
    wordSpacing: 3,
    color: fontColor,
    fontSize: fontSize);

Widget customText(
  String text,
  Color color,
  double size, {
  fontWeight,
  int? maxLines,
  bool? lineThrough,
  bool lineGapNeeded = false,
  TextAlign? textAlign,
  Color? backGroundColor,
}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      height: lineGapNeeded == true ? 1.5 : 0,
      decoration: lineThrough == true
          ? TextDecoration.lineThrough
          : TextDecoration.none,
      backgroundColor: backGroundColor,
    ),
  );
}

Widget customInkWellText(
    Function() onTap, String text, Color color, double size,
    {fontWeight}) {
  return InkWell(
    onTap: onTap,
    child: Text(text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight)),
  );
}

Widget customRichText(String text1, String text2, Color color1, Color color2) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(text: text1, style: TextStyle(color: color1, fontSize: 30)),
        TextSpan(text: text2, style: TextStyle(color: color2, fontSize: 30)),
      ],
    ),
    textScaleFactor: 0.5,
  );
}

Widget customUnderlineText(String text, Color color, double size,
    {fontWeight, decorationColor}) {
  return Text(text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        decorationColor: decorationColor,
      ));
}

Widget customOverflowText(
  String text,
  Color color,
  double size, {
  fontWeight,
  int maxLines = 2,
  TextAlign? textAlign = TextAlign.center,
}) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ));
}
