import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomRichText({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: AppColors.whiteColor1,
          fontSize: AppSize(context).mediumText4,
          fontWeight: FontWeight.normal,
        ),
        children: <TextSpan>[
          TextSpan(
              text: text2,
              style: TextStyle(
                color: AppColors.whiteColor1,
                fontSize: AppSize(context).mediumText3,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
