import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class WidgetProfileListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? language;

  final bool? isLanguage;
  final Function()? onTap;

  const WidgetProfileListTile({
    super.key,
    required this.leading,
    required this.title,
    this.isLanguage = false,
    this.onTap,
    this.language,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            SizedBox(width: AppSize(context).width * 0.05),
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize(context).smallText1,
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            isLanguage == false
                ? const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: AppColors.darkGreyColor,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        language!,
                        style: TextStyle(
                          fontSize: AppSize(context).smallText2,
                          color: AppColors.darkGreyColor,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.darkGreyColor,
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
