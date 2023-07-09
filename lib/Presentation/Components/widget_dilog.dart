import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetDailog {
  static AlertDialog customShowDailog(
      {required String descriptions,
      required BuildContext context,
      IconData? icon,
      Color? iconColor,
      Function()? onTap,
      Function()? cancel,
      bool? isQustion = false,
      required String title}) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(
        descriptions,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: AppSize(context).smallText3,
          color: AppColors.blackColor1,
          fontWeight: FontWeight.normal,
          height: 1.6,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        const Divider(),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: AppSize(context).width * 0.25,
                height: AppSize(context).height * 0.05,
                child: WidgetButton(
                    title: lang.ok,
                    textColor: AppColors.primaryColor,
                    color: AppColors.whiteColor1,
                    onTap: cancel ??
                        () {
                          Navigator.pop(context);
                        }),
              ),
            )
          ],
        )
      ],
    );
  }
}
