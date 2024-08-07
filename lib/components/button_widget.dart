
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? btnText;
  final double? pTop;
  final double? pLeft;
  final double? pBottom;
  final double? pRight;
  final Function()? btnClick;
  final double? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;

  const ButtonWidget({
    this.btnText,
    this.btnClick,
    this.borderRadius,
    this.elevation,
    this.textStyle,
    this.pTop,
    this.pLeft,
    this.pBottom,
    this.pRight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: pTop ?? 0,
            left: pLeft ?? 0,
            right: pRight ?? 0,
            bottom: pBottom ?? 0,
          ),
          elevation: elevation ?? 0,
          backgroundColor: secondary,
          // background
          foregroundColor: onSecondary,
          // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
          )),
      onPressed: btnClick!,
      child: Text(
        btnText ?? "",
        style: textStyle,
      ),
    );
  }
}