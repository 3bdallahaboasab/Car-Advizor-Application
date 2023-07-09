import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/widget/widget_cach_network_image.dart';

class WidgetCarImages extends StatefulWidget {
  final List<String> allImage;

  const WidgetCarImages({
    super.key,
    required this.allImage,
  });

  @override
  State<WidgetCarImages> createState() => _WidgetCarImagesState();
}

class _WidgetCarImagesState extends State<WidgetCarImages> {
  PageController pageController = PageController();
  int ndx = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize(context).height * 0.33,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: AppSize(context).height * 0.27,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: widget.allImage.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      ndx = value + 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    return WidgetCachNetworkImage(
                        image: widget.allImage[index]);
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.blackColor1.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.image,
                        size: 15,
                        color: AppColors.whiteColor1,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$ndx / ${widget.allImage.length}',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                          color: AppColors.whiteColor1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: pageController,
            count: widget.allImage.length,
            axisDirection: Axis.horizontal,
            effect: WormEffect(
              dotColor: AppColors.greyColor1,
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
