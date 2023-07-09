import 'package:flutter/material.dart';

import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetStep extends StatelessWidget {
  final String title;
  final String number;
  final bool? isActive;
  const WidgetStep({
    super.key,
    required this.number,
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // padding: const EdgeInsets.all(5),
          width: AppSize(context).width * 0.1,
          height: AppSize(context).width * 0.1,
          decoration: BoxDecoration(
            color: isActive == false
                ? AppColors.greyColor1
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(100000),
          ),
          child: Center(
              child: Text(
            number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSize(context).smallText2,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.whiteColor1,
            ),
          )),
        ),
      ],
    );
  }
}
