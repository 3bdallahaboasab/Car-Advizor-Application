import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/widget/widget_cach_network_image.dart';
 
class WidgetSelectCarCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool? isSellCar;
  final Function()? onTap;
  const WidgetSelectCarCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    this.onTap,
    this.isSellCar,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: AppSize(context).height * 0.11,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      // * Image
                      Expanded(
                        flex: 3,
                        child: WidgetCachNetworkImage(
                          image: image,
                        ),
                      ),
                      SizedBox(width: AppSize(context).width * 0.02),
                      // * Name & Price
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: AppSize(context).smallText1,
                                  color: AppColors.blackColor1,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: AppSize(context).height * 0.01),
                              Text(
                                price,
                                style: TextStyle(
                                  fontSize: AppSize(context).smallText2,
                                  color: AppColors.greyColor1,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
