import 'package:flutter/material.dart';

class AppImage {
  static String baseUrl = 'assets/image/';

  // * Logo
  static ImageProvider<Object> logo = AssetImage('${baseUrl}logo.png');
  // * Contact us
  static ImageProvider<Object> contactUs =
      AssetImage('${baseUrl}contact_us.jpg');
  // * Add Car
  static ImageProvider<Object> addCar = AssetImage('${baseUrl}add_car.png');
}
