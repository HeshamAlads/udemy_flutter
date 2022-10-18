import 'package:flutter/material.dart';

class Components {
  static Widget defaultButton({
    double width = double.infinity,
    Color background = Colors.blue,
    bool isUpperCase = true,
    double radius = 10.0,
    required Function function,
    required String text,
  }) =>
      Container(
        width: width,
        height: 45.0,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          onPressed: () => function(),
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );
}
