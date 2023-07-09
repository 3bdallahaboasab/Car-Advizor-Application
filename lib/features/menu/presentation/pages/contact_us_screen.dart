import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Image/app_image.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/widget/widget_button.dart';
import 'package:test/features/widget/widget_text_from_filds.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController fname = TextEditingController();

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
        vertical: AppSize(context).height * 0.02,
      ),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Image
          SizedBox(
            width: AppSize(context).width * 0.4,
            height: AppSize(context).width * 0.4,
            child: Image(image: AppImage.contactUs),
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          // * Description
          Text(
            'You\'d like to tell us about something ? We look forward to hearing from you .',
            style: TextStyle(
              fontSize: AppSize(context).smallText3,
              color: AppColors.blackColor1,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          WidgetTextField(
            'Full Name',
            haveBorder: false,
            controller: fname,
          ),
          const Divider(height: 1),
          WidgetTextField(
            'Phone',
            haveBorder: false,
            controller: fname,
          ),
          const Divider(height: 1),
          WidgetTextField(
            'Email',
            haveBorder: false,
            controller: fname,
          ),
          const Divider(height: 1),
          WidgetTextField(
            'Your message',
            haveBorder: false,
            controller: fname,
            maxLines: 4,
          ),
          const Divider(height: 1),
          SizedBox(height: AppSize(context).height * 0.02),
          WidgetButton(
            width: AppSize(context).width * 0.35,
            height: AppSize(context).width * 0.1,
            radius: 1000,
            title: 'Submit',
            onTap: () {},
          )
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
        'Contact Us',
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
