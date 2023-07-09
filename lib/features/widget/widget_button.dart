// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetButton extends StatelessWidget {
  final String title;
  final double? textSize;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final double? height;
  final double? width;
  final Function()? onTap;
  final double? radius;
  const WidgetButton({
    super.key,
    required this.title,
    this.onTap,
    this.textSize,
    this.radius,
    this.height,
    this.child,
    this.color,
    this.width,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? AppSize(context).height * 0.07,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: child ??
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: textSize ?? AppSize(context).smallText2,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? AppColors.whiteColor1,
                ),
              ),
            ),
      ),
    );
  }
}
