import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Icon/app_icons.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/AddCar/Screens/add_car_screen.dart';
import 'package:test/Presentation/Home/Screens/home_screen.dart';
import 'package:test/Presentation/MyCars/Screens/my_cars_screen.dart';
import 'package:test/Presentation/SellCar/Screens/sell_car_screen.dart';
import 'package:test/Presentation/menu/Screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutScreen extends StatefulWidget {
  final int? currentIndex;
  const LayoutScreen({
    Key? key,
    this.currentIndex,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_LayoutStateScreen();
}

class _LayoutStateScreen extends State<LayoutScreen> {
  int currentIndex = 0;

  List<Widget> screen = const [
    HomeScreen(),
    Scaffold(),
    MyCarsScreen(),
    MenuScreen(),
  ];

  List<IconData> icons = [
    Icons.window,
    Icons.list_alt,
    Icons.directions_car_filled,
    Icons.menu,
  ];

  List<String> title = [];

  @override
  void initState() {
    if (widget.currentIndex != null) {
      if (mounted) {
        setState(() {
          currentIndex = widget.currentIndex!;
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    title = [
      AppLocalizations.of(context)!.dashboard,
      AppLocalizations.of(context)!.add,
      AppLocalizations.of(context)!.myCars,
      AppLocalizations.of(context)!.menu,
    ];
    return Scaffold(
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () =>
            Navigator.push(context, downToTop(const SellCarScreen())),
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.sell,
            style: TextStyle(
                fontSize: AppSize(context).smallText2,
                color: AppColors.whiteColor1),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: screen.length,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              index == 1
                  ? SizedBox(
                      width: 22,
                      height: 22,
                      child: AppIcons.addCar,
                    )
                  : index == 2
                      ? SizedBox(
                          width: 22,
                          height: 22,
                          child: currentIndex == index
                              ? AppIcons.primaryCar
                              : AppIcons.blackCar,
                        )
                      : Icon(
                          icons[index],
                          size: 22,
                          color: currentIndex == index
                              ? AppColors.primaryColor
                              : AppColors.blackColor2,
                        ),
              const SizedBox(height: 2),
              Text(
                title[index],
                style: TextStyle(
                    fontSize: AppSize(context).smallText4,
                    color: currentIndex == index
                        ? AppColors.primaryColor
                        : AppColors.greyColor1),
              ),
            ],
          );
        },
        onTap: (int index) => changeBottomIndex(index),
      ),
    );
  }

  void changeBottomIndex(int index) {
    if (index == 1) {
      Navigator.push(context, downToTop(const AddCarScreen()));
    } else {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
