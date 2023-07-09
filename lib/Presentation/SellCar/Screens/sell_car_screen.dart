import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Image/app_image.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/Home/Screens/invoice_details_screen.dart';
import 'package:test/Presentation/menu/Screens/my_store_screen.dart';
import 'package:test/Presentation/menu/Components/widget_form_data.dart';
import 'package:test/Presentation/MyCars/Screens/my_cars_screen.dart';
import 'package:test/Presentation/SellCar/Components/widget_select_car_card.dart';
import 'package:test/Presentation/Components/widget_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SellCarScreen extends StatefulWidget {
  const SellCarScreen({super.key});

  @override
  State<SellCarScreen> createState() => _SellCarScreenState();
}

class _SellCarScreenState extends State<SellCarScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  Map? selectCar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  WidgetButton _buildBottomNavigationBar() {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return WidgetButton(
      radius: 0,
      title: lang.confirm,
      color: AppColors.greenColor,
      onTap: () => Navigator.push(
          context,
          downToTop(const InvoiceDitalsScreen(
            id: '1237',
            isSellCar: true,
          ))),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize(context).width * 0.01,
        vertical: AppSize(context).height * 0.02,
      ),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Image
          SizedBox(
            width: AppSize(context).width * 0.4,
            height: AppSize(context).width * 0.4,
            child: Image(image: AppImage.contactUs),
          ),
          // * Customer Information
          WidgetFormData(
            title: lang.customerInformation,
            children: [
              // * Name
              CustomInputTextForm(
                title: lang.customerName,
                controller: name,
              ),
              // * Phone
              CustomInputTextForm(
                title: lang.customerPhone,
                controller: phone,
                textInputType: TextInputType.phone,
              ),
              // * Email
              CustomInputTextForm(
                title: lang.customerEmailOptional,
                controller: email,
                isLast: true,
              ),
            ],
          ),
          // * Select Car
          WidgetButton(
            title: lang.selectCar,
            height: AppSize(context).height * 0.06,
            onTap: () async {
              final a = await Navigator.push(
                  context,
                  downToTop(const MyCarsScreen(
                    isSellCar: true,
                  )));
              if (a != null) {
                setState(() {
                  selectCar = a;
                });
              }
            },
          ),
          SizedBox(height: AppSize(context).height * 0.01),
          selectCar == null
              ? const SizedBox()
              : WidgetSelectCarCard(
                  isSellCar: true,
                  image: selectCar!['images'].first,
                  title: selectCar!['title'],
                  price: selectCar!['cost_price'],
                ),
        ],
      ),
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
        lang.sellCar,
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
