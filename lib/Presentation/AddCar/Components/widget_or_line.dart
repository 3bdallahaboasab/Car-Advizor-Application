import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetOrDivider extends StatelessWidget {
  const WidgetOrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
              child: Divider(
            color: AppColors.blackColor2,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lang.or,
              style: TextStyle(
                fontSize: AppSize(context).smallText1,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                wordSpacing: 0.5,
              ),
            ),
          ),
          const Expanded(
              child: Divider(
            color: AppColors.blackColor2,
          )),
        ],
      ),
    );
  }
}
