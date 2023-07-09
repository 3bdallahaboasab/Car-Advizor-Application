import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_cach_network_image.dart';

class WidgetImageProfile extends StatelessWidget {
  final String image;
  final File? selectImage;
  final Function()? update;
  const WidgetImageProfile({
    super.key,
    required this.image,
    this.selectImage,
    this.update,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize(context).width * 0.25,
      height: AppSize(context).width * 0.25,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // * Image
          Align(
            alignment: Alignment.center,
            child: Card(
              elevation: 4,
              shadowColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10000),
              ),
              child: Container(
                width: AppSize(context).width * 0.23,
                height: AppSize(context).width * 0.23,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10000),
                ),
                child: selectImage != null
                    ? Image(image: FileImage(selectImage!), fit: BoxFit.cover)
                    : WidgetCachNetworkImage(image: image),
              ),
            ),
          ),
          // * Update
          InkWell(
            onTap: update,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(10000),
              ),
              child: const Icon(
                Icons.flip_camera_ios_outlined,
                size: 17,
                color: AppColors.whiteColor1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
