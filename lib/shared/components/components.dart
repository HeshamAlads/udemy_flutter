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
          onPressed: () {
            function();
          },
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      );

  static Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    Function? onSubmit,
    Function? onChanged,
    required Function validate,
    bool isPassword = false,
    required String label,
    required String hint,
    IconData? prefix,
    IconData? suffix,
    Function? onTapEye,
  }) =>
      TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          onSubmit ?? (s);
        },
        onChanged: (s) {
          onChanged ?? (s);
        },
        obscureText: isPassword,
        validator: (value) {
          return validate(value);
        },
        // (value) => validate(value),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
            onPressed: () => onTapEye!(),
            icon: Icon(suffix),
          ),
          border: const OutlineInputBorder(),
        ),
      );
}
