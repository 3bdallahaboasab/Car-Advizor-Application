import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetCopyRightDigitalTips extends StatelessWidget {
  const WidgetCopyRightDigitalTips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '© Developer ',
              style: TextStyle(
                color: AppColors.greyColor1,
                fontSize: AppSize(context).smallText2,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Digital Tips',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppSize(context).smallText2,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
