import '../widgets/box_neu.dart';
import 'package:flutter/material.dart';

Widget ButtonNeu(
    {String? title, double padding = 17, Color? textColor, bool? darkMode}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: BoxNeu(
      darkMode: darkMode!,
      borderRadius: BorderRadius.circular(40),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        child: SizedBox(
          width: padding * 2,
          height: padding * 2,
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                  color: textColor ?? (darkMode ? Colors.white : Colors.black),
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
        ),
      ),
    ),
  );
}
