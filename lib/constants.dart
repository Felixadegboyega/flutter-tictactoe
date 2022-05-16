import 'package:flutter/material.dart';

InputDecoration kInputDecoration(label) => InputDecoration(
      border: InputBorder.none,
      hintText: label,
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      // labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
    );

// TextStyle kTextStyle = const TextStyle(
//     fontSize: 128, fontWeight: FontWeight.bold, color: Colors.white);

ButtonStyle kButtonStyle(double width, bgcolor) => ButtonStyle(
    fixedSize: MaterialStateProperty.resolveWith((states) => Size(width, 50)),
    textStyle: MaterialStateProperty.resolveWith(
        (states) => const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    backgroundColor: MaterialStateProperty.resolveWith((states) => bgcolor),
    elevation: MaterialStateProperty.resolveWith((states) => 5),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    )));
