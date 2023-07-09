import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_cach_network_image.dart';
import 'package:test/Presentation/Components/widget_text_from_filds.dart';

class SelectDataScreen extends StatefulWidget {
  final bool? haveIcon;
  final String title;
  final String? textSearch;
  final List<Map<String, dynamic>> data;
  const SelectDataScreen(
      {super.key,
      this.haveIcon = false,
      required this.title,
      this.textSearch,
      required this.data});

  @override
  State<SelectDataScreen> createState() => _SelectDataScreenState();
}

class _SelectDataScreenState extends State<SelectDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: AppSize(context).appPadding,
        itemCount: widget.data.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: AppSize(context).height * 0.01),
        itemBuilder: (context, index) {
          Map subData = widget.data[index];
          return Row(
            children: [
              widget.haveIcon != true
                  ? const SizedBox()
                  : SizedBox(
                      width: 45,
                      height: 45,
                      child: WidgetCachNetworkImage(
                        image: subData['image'],
                        boxFit: BoxFit.cover,
                      ),
                    ),
              Radio<String>(
                value: subData['value'].toString(),
                groupValue: '1',
                onChanged: (v) {},
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subData['title'].toString(),
                    style: TextStyle(
                      fontSize: AppSize(context).smallText1,
                      color: AppColors.blackColor1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: AppSize(context).width * 0.64,
                    height: 0.1,
                    color: AppColors.greyColor3,
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
          double.infinity,
          widget.textSearch == null
              ? AppSize(context).height * 0.08
              : AppSize(context).height * 0.14),
      child: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: AppSize(context).mediumText3,
            color: AppColors.whiteColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText3,
                    color: AppColors.whiteColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        flexibleSpace: widget.textSearch == null
            ? const SizedBox()
            : SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppSize(context).height * 0.07,
                      right: AppSize(context).width * 0.05,
                      left: AppSize(context).width * 0.05),
                  child: WidgetTextField(
                    widget.textSearch!,
                    radius: 10,
                    fillColor: AppColors.greyColor1.withOpacity(0.2),
                    haveBorder: false,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.greyColor3,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
