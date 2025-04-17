import 'package:flutter/material.dart';

class CutumTextFieldWidget extends StatelessWidget {
  CutumTextFieldWidget({
    required this.title,
    this.onTap,
    this.validater,
    this.obscureText = false,
  });
  String title;
  Function(String)? onTap;
  bool obscureText;
  String? Function(String?)? validater;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validater,
      onChanged: onTap,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
