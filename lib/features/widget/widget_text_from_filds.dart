import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(dynamic)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final Color? fillColor;
  final int? maxLength;
  final int maxLines;
  final double? radius;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final bool? haveBorder;
  final TextStyle? textStyle;
  final Function()? onTap;

  const WidgetTextField(
    this.hintText, {
    this.onChanged,
    this.readOnly,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.focusNode,
    this.maxLines = 1,
    this.maxLength,
    Key? key,
    this.fillColor,
    this.haveBorder,
    this.padding,
    this.onTap,
    this.radius, this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly ?? false,
      onTap: onTap,
      validator: validator,
      focusNode: focusNode,
      style:textStyle?? TextStyle(fontSize: AppSize(context).smallText1),
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintStyle: TextStyle(
            color: AppColors.greyColor1,
            fontSize: AppSize(context).smallText3,
            letterSpacing: .5),
        contentPadding: padding ?? const EdgeInsets.all(10.0),
        fillColor: fillColor ?? AppColors.whiteColor1,
        filled: true,
        prefixIcon: prefixIcon,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: haveBorder == false
            ? InputBorder.none
            : OutlineInputBorder(
                gapPadding: 0,
                borderSide: const BorderSide(color: AppColors.greyColor1),
                borderRadius: BorderRadius.circular(radius ?? 15)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? 15)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? 15)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: BorderSide(
                color: haveBorder == null
                    ? AppColors.greyColor1
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? 15)),
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
      ),
    );
  }
}
