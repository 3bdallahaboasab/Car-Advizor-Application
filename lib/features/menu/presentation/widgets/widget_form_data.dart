import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';

class WidgetFormData extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool? isAddCar;
  const WidgetFormData({
    super.key,
    required this.title,
    required this.children,
    this.isAddCar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize(context).width * 0.03,
        vertical: AppSize(context).height * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 3,
            shadowColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // *Header
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize(context).width * 0.03,
                    ),
                    width: double.infinity,
                    height: AppSize(context).height * 0.06,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 237, 230, 230),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isAddCar == true
                                  ? AppSize(context).smallText2
                                  : AppSize(context).smallText3,
                              color: isAddCar == true
                                  ? AppColors.greyColor2
                                  : AppColors.greyColor3,
                              fontWeight: isAddCar == true
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize(context).width * 0.03,
                      vertical: AppSize(context).height * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
