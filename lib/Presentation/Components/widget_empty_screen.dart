import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_button.dart';
import 'package:test/layout_screen.dart';

class WidgetEmptyScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final bool? isCart;
  const WidgetEmptyScreen(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subtitle,
      this.isCart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppSize(context).width * 0.05,
          right: AppSize(context).width * 0.05,
          top: AppSize(context).height * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppSize(context).width * 0.4,
              width: AppSize(context).width * 0.3,
              child: icon,
            ),
            SizedBox(height: AppSize(context).height * 0.02),
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize(context).mediumText1,
                height: 1.3,
                fontStyle: FontStyle.italic,
                color: AppColors.blackColor3,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize(context).height * 0.02),
            Center(
              child: SizedBox(
                width: AppSize(context).width * 0.5,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppSize(context).smallText1,
                    height: 1.3,
                    fontStyle: FontStyle.italic,
                    color: AppColors.darkGreyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            isCart == false
                ? const SizedBox()
                : SizedBox(height: AppSize(context).height * 0.15),
            isCart == false
                ? const SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize(context).width * 0.05),
                    child: WidgetButton(
                      title: 'Shoping Now ',
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            downToTop(const LayoutScreen(
                              currentIndex: 0,
                            )),
                            (route) => false);
                      },
                      textSize: AppSize(context).mediumText3,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
