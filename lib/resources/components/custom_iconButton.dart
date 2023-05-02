import 'package:flutter/material.dart';

Widget customIconButton({
  String badgeContent = '',
  bool showBadge = false,
  Color? iconColor,
  required Function()? onPressed,
  required IconData? icon,
}) {
  return IconButton(
    onPressed: onPressed,
    splashRadius: 20,
    icon: Badge(
        isLabelVisible: showBadge,
        label: Text(badgeContent,
            style: const TextStyle(color: Colors.white, fontSize: 10)),
        child: Icon(icon, size: 20, color: iconColor)),
  );
}
