import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/AddCar/Components/widget_head_shipping_method.dart';
import 'package:test/Presentation/AddCar/Screens/add_car_details_screen.dart';
import 'package:test/Presentation/AddCar/Screens/add_car_informaion_screen.dart';
import 'package:test/Presentation/AddCar/Screens/select_parts_screen.dart';
import 'package:test/Presentation/Components/widget_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddManualScreen extends StatefulWidget {
  const AddManualScreen({super.key});

  @override
  State<AddManualScreen> createState() => _AddManualScreenState();
}

class _AddManualScreenState extends State<AddManualScreen> {
  bool addInfo = true;
  bool addDetails = false;
  bool selectParts = false;
  bool showBack = false;
  bool showConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: AppSize(context).appPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetHeaderShippingMethod(
            deliveray: addInfo,
            address: addDetails,
            payment: selectParts,
          ),
          SizedBox(height: AppSize(context).height * 0.02),
          const Divider(),
          addInfo == true && addDetails == false && selectParts == false
              ? const AddCarInformationScreen()
              : (addInfo == true && addDetails == true && selectParts == false)
                  ? const AddCarDetailsScreen()
                  : (addInfo == true &&
                          addDetails == true &&
                          selectParts == true)
                      ? const SelectPartsScreen()
                      : const SizedBox(),
        ],
      ),
    );
  }

  dynamic _buildBottomNavigationBar() {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return showConfirm == false
        ? showBack == true
            ? Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          addDetails = false;
                          showBack = false;
                        });
                      },
                      child: Container(
                        height: AppSize(context).height * 0.07,
                        color: AppColors.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: AppColors.whiteColor1,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              lang.previous,
                              style: TextStyle(
                                fontSize: AppSize(context).buttonText2,
                                color: AppColors.whiteColor1,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectParts = true;
                          showConfirm = true;
                        });
                      },
                      child: Container(
                        height: AppSize(context).height * 0.07,
                        color: AppColors.primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              lang.next,
                              style: TextStyle(
                                fontSize: AppSize(context).buttonText2,
                                color: AppColors.whiteColor1,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: AppColors.whiteColor1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : WidgetButton(
                title: lang.next,
                radius: 0,
                onTap: () {
                  if (addInfo == true &&
                      addDetails == false &&
                      selectParts == false) {
                    setState(() {
                      addDetails = true;
                      showBack = true;
                    });
                  }
                },
              )
        : Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectParts = false;
                      showConfirm = false;
                    });
                  },
                  child: Container(
                    height: AppSize(context).height * 0.07,
                    color: AppColors.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.whiteColor1,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          lang.previous,
                          style: TextStyle(
                            fontSize: AppSize(context).buttonText2,
                            color: AppColors.whiteColor1,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // * Compleated All Status
                    pop(context);
                  },
                  child: Container(
                    height: AppSize(context).height * 0.07,
                    color: AppColors.greenColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          lang.confirmss,
                          style: TextStyle(
                            fontSize: AppSize(context).buttonText2,
                            color: AppColors.whiteColor1,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.check,
                          size: 20,
                          color: AppColors.whiteColor1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }

  AppBar _buildAppBar(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        lang.addCars,
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const SizedBox(),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lang.close,
                  style: TextStyle(
                    fontSize: AppSize(context).mediumText3,
                    color: AppColors.whiteColor1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
