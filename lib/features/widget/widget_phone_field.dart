import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetPhoneField extends StatefulWidget {
  final Function(Country)? onCountryChanged;
  final TextEditingController phoneController;
  const WidgetPhoneField(
      {super.key,
      required this.onCountryChanged,
      required this.phoneController});

  @override
  State<WidgetPhoneField> createState() => _WidgetPhoneFieldState();
}

class _WidgetPhoneFieldState extends State<WidgetPhoneField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onCountryChanged: widget.onCountryChanged,
      controller: widget.phoneController,
      invalidNumberMessage: null,
      style:
          TextStyle(color: Colors.black, fontSize: AppSize(context).smallText2),
      dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintText: 'Phone Number',
        hintStyle: TextStyle(
            color: AppColors.lightGreyColor,
            fontSize: AppSize(context).smallText3),
        fillColor: AppColors.whiteColor1,
        filled: true,
        border: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            gapPadding: 0,
            borderSide: const BorderSide(color: AppColors.whiteColor1),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: AppColors.whiteColor1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      initialCountryCode: 'JO',
    );
  }
}
