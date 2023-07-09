// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/Data/Theme/color_constant.dart';

class AppIcons {
  static String baceUrl = 'assets/icon/';

  // * Car [ Orange ]
  static SvgPicture orangeCar = SvgPicture.asset(
    '${baceUrl}car.svg',
    colorFilter: ColorFilter.mode(
      AppColors.orangeColor,
      BlendMode.srcIn,
    ),
  );
  // * Car [ Black ]
  static SvgPicture blackCar = SvgPicture.asset(
    '${baceUrl}car.svg',
    colorFilter: const ColorFilter.mode(
      AppColors.blackColor1,
      BlendMode.srcIn,
    ),
  );
  // * Car [ Primary ]
  static SvgPicture primaryCar = SvgPicture.asset(
    '${baceUrl}car.svg',
    colorFilter: ColorFilter.mode(
      AppColors.primaryColor,
      BlendMode.srcIn,
    ),
  );
  // * Stars [ Yellow ]
  static SvgPicture yelloStars = SvgPicture.asset(
    '${baceUrl}stars.svg',
    colorFilter: ColorFilter.mode(
      AppColors.yellowColor,
      BlendMode.srcIn,
    ),
  );
  // * Dollar [ Green ]
  static SvgPicture greenDollar = SvgPicture.asset(
    '${baceUrl}dollar.svg',
    colorFilter: ColorFilter.mode(
      AppColors.greenColor,
      BlendMode.srcIn,
    ),
  );
  // * Dollar [ Parpol ]
  static SvgPicture parpolDollar = SvgPicture.asset(
    '${baceUrl}dollar.svg',
    colorFilter: ColorFilter.mode(
      AppColors.parpolColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Parpol ]
  static SvgPicture lineParpol = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.parpolColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Orange ]
  static SvgPicture lineOrange = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.orangeColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Green ]
  static SvgPicture lineGreen = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.greenColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Rrd ]
  static SvgPicture lineRrd = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.redColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Blue ]
  static SvgPicture lineBlue = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.blueColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Yellow ]
  static SvgPicture lineYellow = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.yellowColor,
      BlendMode.srcIn,
    ),
  );
  // * Line [ Indigo ]
  static SvgPicture lineIndigo = SvgPicture.asset(
    '${baceUrl}line.svg',
    colorFilter: ColorFilter.mode(
      AppColors.indigoColor,
      BlendMode.srcIn,
    ),
  );
  // * Add Car
  static SvgPicture addCar = SvgPicture.asset(
    '${baceUrl}add_car.svg',
    colorFilter: const ColorFilter.mode(
      AppColors.blackColor1,
      BlendMode.srcIn,
    ),
  );
}
