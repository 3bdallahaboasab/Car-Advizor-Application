import 'package:flutter/material.dart';
import 'package:test/Data/Theme/color_constant.dart';

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Divider(
        color: AppColors.greyColor1,
        thickness: 0.6,
      ),
    );
  }
}
