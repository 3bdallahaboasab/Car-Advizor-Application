import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/AddCar/Components/widget_dash.dart';
import 'package:test/Presentation/AddCar/Components/widget_step.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WidgetHeaderShippingMethod extends StatelessWidget {
  const WidgetHeaderShippingMethod({
    super.key,
    required this.deliveray,
    required this.address,
    required this.payment,
  });

  final bool deliveray;
  final bool address;
  final bool payment;

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetStep(
              title: 'Add car information',
              number: '1',
              isActive: deliveray,
            ),
            WidgetDash(
              isActive: deliveray,
            ),
            WidgetStep(
              title: 'add car details',
              number: '2',
              isActive: address,
            ),
            WidgetDash(
              isActive: address,
            ),
            WidgetStep(
              title: 'Select a part(s)',
              number: '3',
              isActive: payment,
            ),
          ],
        ),
        SizedBox(height: AppSize(context).height * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppSize(context).width * 0.3,
                child: Text(
                  lang.addCarInformayion,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText3,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.greyColor2,
                  ),
                ),
              ),
              SizedBox(
                width: AppSize(context).width * 0.3,
                child: Text(
                  lang.addCarDetails,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText3,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    color: AppColors.greyColor2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                width: AppSize(context).width * 0.3,
                child: Text(
                  lang.selectParts,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText3,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.greyColor2,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
