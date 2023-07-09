import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Components/widget_cach_network_image.dart';

class WidgetCavarImageProfile extends StatelessWidget {
  final String image;
  final File? selectImage;
  final Function()? update;
  const WidgetCavarImageProfile({
    super.key,
    required this.image,
    this.update,
    this.selectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize(context).height * 0.27,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          selectImage != null
              ? Image(image: FileImage(selectImage!), fit: BoxFit.cover)
              : WidgetCachNetworkImage(image: image),
          IconButton(
            onPressed: update,
            icon: const Icon(
              Icons.flip_camera_ios_outlined,
              size: 25,
              color: AppColors.whiteColor1,
            ),
          ),
        ],
      ),
    );
  }
}
