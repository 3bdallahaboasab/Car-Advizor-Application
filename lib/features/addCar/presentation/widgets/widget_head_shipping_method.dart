import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/addCar/presentation/widgets/widget_dash.dart';
import 'package:test/features/addCar/presentation/widgets/widget_step.dart';

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
                  'Add car information',
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
                  'add car details',
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
                  'Select a part(s)',
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
