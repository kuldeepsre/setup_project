import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_project/utils/text_style.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  CancelButton({super.key, required this.onPressed, required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: headingStyle),
            ),
          ),
        ),

    );
  }
}