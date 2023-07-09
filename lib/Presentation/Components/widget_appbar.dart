import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Theme/color_constant.dart';

class WigetAppBar {
  // Todo :- Text style for title appbar
  static TextStyle textStyle({
    required BuildContext context,
  }) {
    return TextStyle(
      color: AppColors.blackColor1,
      fontSize: AppSize(context).mediumText3,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      fontStyle: FontStyle.italic,
    );
  }

  // Todo :- AppBar with actions
  static AppBar appBar({
    required BuildContext context,
    required String title,
    bool? bc,
    List<Widget>? actions,
    double? elevation,
  }) {
    return AppBar(
      systemOverlayStyle: bc == null
          ? null
          : SystemUiOverlayStyle(
              statusBarColor: AppColors.backgroundColor,
              statusBarIconBrightness: Brightness.dark,
            ),
      backgroundColor: bc == null ? null : AppColors.backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: textStyle(context: context),
      ),
      elevation: elevation ?? 0.0,
      actions: actions,
    );
  }

  // Todo :- AppBar with leading and actions
  static AppBar appBarWithlanding({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? landing,
    double? elevation,
  }) {
    return AppBar(
      title: Text(
        title,
        style: textStyle(context: context),
      ),
      elevation: elevation ?? 0.0,
      centerTitle: true,
      actions: actions,
      leading: landing,
    );
  }

  // Todo : AppBar with Tab View Tow Page
  static AppBar appBarWithTabViewTowPage({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? landing,
    Color? indicatorColor,
  }) {
    return AppBar(
      title: Text(
        title,
        style: textStyle(context: context),
      ),
      centerTitle: true,
      actions: actions,
      leading: landing,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: indicatorColor,
        tabs: const [
          Tab(
            text: 'One',
          ),
          Tab(
            text: 'Tow',
          ),
        ],
      ),
    );
  }

  // Todo : AppBar with Tab View Three Page
  static AppBar appBarWithTabViewThreePage({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    Widget? landing,
    Color? indicatorColor,
  }) {
    return AppBar(
      title: Text(
        title,
        style: textStyle(context: context),
      ),
      centerTitle: true,
      actions: actions,
      leading: landing,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: indicatorColor,
        tabs: const [
          Tab(
            text: 'One',
          ),
          Tab(
            text: 'Tow',
          ),
          Tab(
            text: 'Three',
          ),
        ],
      ),
    );
  }

  // Todo : AppBar with Tab View Three Page
  static AppBar appBarWithDynamicTaps({
    required BuildContext context,
    required String title,
    List<Widget>? actions,
    List<Widget>? taps,
    Widget? landing,
    Color? indicatorColor,
  }) {
    return AppBar(
      title: Text(
        title,
        style: textStyle(context: context),
      ),
      centerTitle: true,
      actions: actions,
      leading: landing,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: indicatorColor,
        tabs: taps!,
      ),
    );
  }
}
