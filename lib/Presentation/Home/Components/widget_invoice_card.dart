import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class WidgetInvoiceCard extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String price;
  final String ref;
  final Function()? onTap;

  const WidgetInvoiceCard({
    super.key,
    required this.id,
    required this.name,
    required this.date,
    required this.price,
    required this.ref,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Id & Date
          SizedBox(
            width: AppSize(context).width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  '# $id',
                  style: TextStyle(
                    fontSize: AppSize(context).smallText1,
                    color: AppColors.blackColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText3,
                    color: AppColors.greyColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize(context).height * 0.01),
          // * Name & Price
          SizedBox(
            width: AppSize(context).width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Customer : $name',
                  style: TextStyle(
                    fontSize: AppSize(context).smallText2,
                    color: AppColors.blackColor1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText1,
                    color: AppColors.greyColor3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize(context).height * 0.01),
          Text(
            'Ref. number : $ref',
            style: TextStyle(
              fontSize: AppSize(context).smallText2,
              color: AppColors.greyColor3,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
