import 'package:flutter/material.dart';

class CustemButtonWidget extends StatelessWidget {
  String title;
  VoidCallback? onTap;
  CustemButtonWidget({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: TextStyle(color: Color(0xff9E9E9E), fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
