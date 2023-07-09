import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetInfoPage extends StatelessWidget {
  final String title;
  final String subTitle;
  const WidgetInfoPage({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppSize(context).mediumText3,
            color: AppColors.blackColor1,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: AppSize(context).height * 0.007),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: AppSize(context).smallText2,
            color: AppColors.greyColor3,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: AppSize(context).height * 0.02),
      ],
    );
  }
}
