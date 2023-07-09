import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class PrivacePolicyScreen extends StatefulWidget {
  const PrivacePolicyScreen({super.key});

  @override
  State<PrivacePolicyScreen> createState() => _PrivacePolicyScreenState();
}

class _PrivacePolicyScreenState extends State<PrivacePolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize(context).width * 0.05,
          vertical: AppSize(context).height * 0.02),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Policy',
            style: TextStyle(
              fontSize: AppSize(context).mediumText3,
              color: AppColors.blackColor1,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'Privacy Policy',
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
