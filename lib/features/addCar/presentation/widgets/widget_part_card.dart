import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WedgitPartCard extends StatelessWidget {
  final String title;
  final String? titleAddCard;

  final bool value;
  final bool? isAddCar;
  final Function(bool?)? onChange;
  final Widget icon;
  const WedgitPartCard({
    super.key,
    required this.title,
    required this.value,
    this.onChange,
    required this.icon,
    this.isAddCar,
    this.titleAddCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize(context).height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                width: AppSize(context).width * 0.23,
                height: AppSize(context).width * 0.13  ,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 230, 230),
                ),
                child: icon),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 8,
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppSize(context).smallText3,
                color: AppColors.darkGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: isAddCar == true
                  ? Text(
                      titleAddCard!,
                      style: TextStyle(
                        fontSize: AppSize(context).smallText2,
                        color: AppColors.greyColor1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  : Checkbox(value: value, onChanged: onChange)),
        ],
      ),
    );
  }
}
