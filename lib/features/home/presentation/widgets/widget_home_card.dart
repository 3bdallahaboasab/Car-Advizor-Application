import 'package:flutter/material.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetHomeCard extends StatelessWidget {
  final Widget? child;
  final bool? isFirstCard;
  const WidgetHomeCard({
    super.key,
    this.child,
    this.isFirstCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.grey.shade100,
      elevation: 5,
      child: Container(
        padding: isFirstCard == true ? null : const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.whiteColor1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
