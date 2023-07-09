import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_text_from_filds.dart';

class WidgetInputTextForm2 extends StatelessWidget {
  final String title;
  final String? hint;
  final TextEditingController controller;
  final int? maxLine;
  final bool? isLast;
  final bool? isActive;
  final TextInputType? textInputType;
  final Function()? onTap;
  const WidgetInputTextForm2({
    super.key,
    required this.title,
    required this.controller,
    this.maxLine,
    this.isLast = false,
    this.onTap,
    this.textInputType,
    this.hint,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: AppSize(context).smallText2,
            color: isActive == false
                ? AppColors.greyColor1
                : AppColors.darkGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        maxLine != null
            ? SizedBox(height: AppSize(context).height * 0.01)
            : const SizedBox(),
        SizedBox(
          height: AppSize(context).height * 0.055,
          child: WidgetTextField(
            hint,
            controller: controller,
            padding: const EdgeInsets.all(5),
            haveBorder: false,
            keyboardType: textInputType,
            maxLines: maxLine ?? 1,
            onTap: isActive == false ? () {} : onTap,
            readOnly: onTap != null ? true : false,
            suffixIcon: onTap != null
                ? Icon(
                    Icons.arrow_drop_down,
                    color: isActive == false
                        ? AppColors.greyColor1
                        : AppColors.darkGreyColor,
                  )
                : null,
          ),
        ),
        isLast == true
            ? const SizedBox()
            : Divider(
                height: 1,
                color: AppColors.lightGreyColor.withOpacity(0.7),
              ),
        isLast == true
            ? const SizedBox()
            : SizedBox(height: AppSize(context).height * 0.01),
      ],
    );
  }
}
