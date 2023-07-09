import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 
Future<dynamic> pickImage(
    {ImageSource? source,
    bool? needPath = false,
    required BuildContext context,
    preferredCameraDevice = CameraDevice.front}) async {
  final picker = ImagePicker();

  String path = '';
  File? pathFile;

  try {
    final getImage = await picker.pickImage(source: source!);

    if (getImage != null) {
      path = getImage.path;
      pathFile = File(getImage.path);
    } else {
      path = '';
    }
  } catch (e) {
    log(e.toString());
  }

  if (needPath == true) {
    return pathFile;
  } else {
    return path;
  }
}
