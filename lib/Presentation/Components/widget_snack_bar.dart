import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

widgetSnackBar({
  required BuildContext context,
  required String text,
  required bool? isError,
  required bool? success,
  int? second,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: second ?? 4),
    content: Text(
      success == true
          ? text
          : isError == true
              ? 'Something Error'
              : text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: AppSize(context).smallText1,
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: success == true
        ? AppColors.greenColor
        : isError == true
            ? AppColors.redColor
            : AppColors.greenColor,
  ));
}
