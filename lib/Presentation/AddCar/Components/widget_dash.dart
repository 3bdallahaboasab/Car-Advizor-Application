import 'package:flutter/material.dart';

import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class WidgetDash extends StatelessWidget {
  final bool? isActive;

  const WidgetDash({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: AppSize(context).width * 0.23,
          height: 4,
          color:
              isActive == false ? AppColors.greyColor1 : AppColors.primaryColor,
        ),
      ],
    );
  }
}
