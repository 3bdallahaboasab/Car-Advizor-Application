import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetLanguageListTile extends StatelessWidget {
  final String title;
  final bool? isActive;
  final Function()? onTap;
  const WidgetLanguageListTile({
    super.key,
    required this.title,
    this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize(context).smallText2,
                color: isActive == true
                    ? AppColors.indigoColor
                    : AppColors.darkGreyColor,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            isActive == false
                ? const SizedBox()
                : Icon(
                    Icons.check,
                    size: 15,
                    color: isActive == true
                        ? AppColors.indigoColor
                        : AppColors.darkGreyColor,
                  ),
          ],
        ),
      ),
    );
  }
}
