import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Data/demo_date.dart';
import 'package:test/Presentation/MyCars/Screens/car_details_screen.dart';
import 'package:test/Presentation/Components/widget_text_from_filds.dart';
import 'package:test/Presentation/MyCars/Components/widget_car_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCarsScreen extends StatefulWidget {
  final bool? isSectionHome;
  final bool? isSolidCar;
  final bool? isSellCar;

  const MyCarsScreen({
    super.key,
    this.isSolidCar = false,
    this.isSectionHome = false,
    this.isSellCar = false,
  });

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  RefreshIndicator _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        padding: AppSize(context).appPadding,
        physics: const BouncingScrollPhysics(),
        itemCount: DemoData.allCars.length,
        separatorBuilder: (context, index) =>
            SizedBox(height: AppSize(context).height * 0.005),
        itemBuilder: (context, index) {
          Map cars = DemoData.allCars[index];

          if (widget.isSectionHome == false) {
            return WidgetCarCard(
              index: index,
              image: cars['images'].first,
              title: cars['title'],
              price: '${cars['cost_price']} / ${cars['sell_price']}',
              onTap: () {
                if (widget.isSellCar == true) {
                  Navigator.pop(context, cars);
                } else {
                  Navigator.push(
                      context, downToTop(CarDetailsScreen(carDetails: cars)));
                }
              },
            );
          } else {
            if (widget.isSolidCar == false) {
              if (index.isEven == true) {
                return WidgetCarCard(
                  index: index,
                  image: cars['images'].first,
                  title: cars['title'],
                  price: '${cars['cost_price']} / ${cars['sell_price']}',
                  onTap: () {
                    Navigator.push(
                        context, downToTop(CarDetailsScreen(carDetails: cars)));
                  },
                );
              } else {
                return const SizedBox();
              }
            } else {
              if (index.isOdd == true) {
                return WidgetCarCard(
                  index: index,
                  image: cars['images'].first,
                  title: cars['title'],
                  price: '${cars['cost_price']} / ${cars['sell_price']}',
                  onTap: () {
                    Navigator.push(
                        context, downToTop(CarDetailsScreen(carDetails: cars)));
                  },
                );
              } else {
                return const SizedBox();
              }
            }
          }
        },
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return PreferredSize(
      preferredSize: Size(double.infinity, AppSize(context).height * 0.14),
      child: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text(
          lang.myCars,
          style: TextStyle(
            fontSize: AppSize(context).mediumText3,
            color: AppColors.whiteColor1,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: AppSize(context).height * 0.07,
                right: AppSize(context).width * 0.05,
                left: AppSize(context).width * 0.05),
            child: WidgetTextField(
              lang.search,
              radius: 10,
              fillColor: AppColors.greyColor1.withOpacity(0.2),
              haveBorder: false,
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.greyColor3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
