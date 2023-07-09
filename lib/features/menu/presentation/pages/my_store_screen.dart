import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/menu/presentation/widgets/widget_cavar_image_profile.dart';
import 'package:test/features/menu/presentation/widgets/widget_form_data.dart';
import 'package:test/features/menu/presentation/widgets/widget_image_profile.dart';
import 'package:test/features/widget/widget_button.dart';
import 'package:test/features/widget/widget_text_from_filds.dart';

enum SingingCharacter { lafayette, jefferson }

class MyStoreScreen extends StatefulWidget {
  const MyStoreScreen({super.key});

  @override
  State<MyStoreScreen> createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mobail = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController invoice = TextEditingController();
  TextEditingController startInvoice = TextEditingController();
  TextEditingController domain = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController currancy = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController instgram = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController linkedIn = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  WidgetButton _buildBottomNavigationBar() {
    return WidgetButton(
      radius: 0,
      title: 'Update',
      onTap: () {},
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // * Image Cavar
          WidgetCavarImageProfile(
            image:
                'https://hips.hearstapps.com/hmg-prod/images/2023-jeep-compass-101-1669747450.jpg?crop=0.705xw:0.529xh;0.103xw,0.317xh&resize=1200:*',
            update: () => showMenu(),
          ),
          // * Containt
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize(context).height * 0.19),
              // * Image Profile
              WidgetImageProfile(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzpAIprXCYrYC9zsTc6oJJdUPZXUrKCWgJ7g&usqp=CAU',
                update: () => showMenu(),
              ),
              // * Store Informations
              WidgetFormData(
                title: 'Store Information',
                children: [
                  // * Name
                  CustomInputTextForm(
                    title: 'Store name',
                    controller: name,
                  ),
                  // * Email
                  CustomInputTextForm(
                    title: 'Store email',
                    controller: email,
                  ),
                  // * Phone
                  CustomInputTextForm(
                    title: 'Store phone',
                    controller: phone,
                    textInputType: TextInputType.phone,
                  ),
                  // * Mobail
                  CustomInputTextForm(
                    title: 'Store mobail',
                    controller: mobail,
                  ),
                  // * About
                  CustomInputTextForm(
                    title: 'Store about',
                    controller: about,
                    maxLine: 3,
                  ),
                  // * Brands
                  CustomInputTextForm(
                    title: 'Brand(s)',
                    controller: brand,
                    onTap: () => showDetailsBrands(),
                  ),
                  // * Currency
                  CustomInputTextForm(
                    title: 'Currency',
                    controller: currancy,
                    onTap: () => showDetails('Currency'),
                  ),
                  // * Invoice prefix
                  CustomInputTextForm(
                    title: 'Invoice prefix',
                    controller: invoice,
                  ),
                  // * Invoice start from
                  CustomInputTextForm(
                    title: 'Invoice start from',
                    controller: startInvoice,
                  ),
                  // * Store Domain
                  CustomInputTextForm(
                    title: 'Store Domain',
                    controller: domain,
                    isLast: true,
                  ),
                ],
              ),
              // * Store Address
              WidgetFormData(
                title: 'Store Address',
                children: [
                  // * Country
                  CustomInputTextForm(
                    title: 'Country',
                    controller: country,
                    onTap: () => showDetails('Country'),
                  ),
                  // * City
                  CustomInputTextForm(
                    title: 'City',
                    controller: city,
                    onTap: () => showDetails('City'),
                  ),
                  // * Address
                  CustomInputTextForm(
                    title: 'Address',
                    controller: address,
                    maxLine: 3,
                    isLast: true,
                  ),
                ],
              ),
              // * Store Social Links
              WidgetFormData(
                title: 'Store Social Links',
                children: [
                  // * Facebook
                  CustomInputTextForm(
                    title: 'Facebook',
                    controller: facebook,
                  ),
                  // * Instgram
                  CustomInputTextForm(
                    title: 'Instgram',
                    controller: instgram,
                  ),
                  // * Twitter
                  CustomInputTextForm(
                    title: 'Twitter',
                    controller: twitter,
                  ),
                  // * LinkedIn
                  CustomInputTextForm(
                    title: 'LinkedIn',
                    controller: linkedIn,
                    isLast: true,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'My Store',
        style: TextStyle(
          fontSize: AppSize(context).mediumText3,
          color: AppColors.whiteColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void showMenu() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.only(bottom: 20),
            elevation: 0.0,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppSize(context).width * 0.9,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Select a picture from gallery',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        highlightColor: AppColors.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 20,
                              color: AppColors.indigoColor,
                            ),
                            SizedBox(width: AppSize(context).width * 0.02),
                            Text(
                              'Take a picture from camera',
                              style: TextStyle(
                                fontSize: AppSize(context).smallText3,
                                color: AppColors.indigoColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  onTap: () => pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText3,
                          color: AppColors.indigoColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }

  void showDetailsBrands() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Brand(s)',
              style: TextStyle(
                fontSize: AppSize(context).mediumText2,
                color: AppColors.blackColor1,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Divider(),
            SizedBox(
              height: AppSize(context).height * 0.3,
              child: ListView.separated(
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize(context).height * 0.0),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(value: false, onChanged: (v) {}),
                      const SizedBox(width: 6),
                      Text(
                        'Example',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText2,
                          color: AppColors.blackColor1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        actions: [
          const Divider(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppSize(context).smallText2,
                              color: AppColors.indigoColor,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Center(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText2,
                            color: AppColors.indigoColor,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showDetails(String title) {
    SingingCharacter? _character = SingingCharacter.lafayette;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSize(context).mediumText2,
                color: AppColors.blackColor1,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Divider(),
            SizedBox(
              height: AppSize(context).height * 0.3,
              child: ListView.separated(
                itemCount: 2,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize(context).height * 0.0),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Radio<SingingCharacter>(
                        value: SingingCharacter.lafayette,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Example',
                        style: TextStyle(
                          fontSize: AppSize(context).smallText2,
                          color: AppColors.blackColor1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        actions: [
          const Divider(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: AppSize(context).smallText2,
                              color: AppColors.indigoColor,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Center(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select',
                          style: TextStyle(
                            fontSize: AppSize(context).smallText2,
                            color: AppColors.indigoColor,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomInputTextForm extends StatelessWidget {
  final String title;
  final String? hint;
  final TextEditingController controller;
  final int? maxLine;
  final bool? isLast;
  final bool? isAddCar;
  final bool? isActive;
  final bool? isExpenses;
  final bool? readOnly;
  final TextInputType? textInputType;
  final Function()? onTap;
  const CustomInputTextForm({
    super.key,
    required this.title,
    required this.controller,
    this.maxLine,
    this.isLast = false,
    this.onTap,
    this.textInputType,
    this.isAddCar = false,
    this.hint,
    this.isActive = false,
    this.readOnly,
    this.isExpenses = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isAddCar == true
                ? AppSize(context).smallText2
                : AppSize(context).smallText4,
            color: AppColors.darkGreyColor,
            fontWeight: isAddCar == true ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        maxLine != null
            ? SizedBox(height: AppSize(context).height * 0.01)
            : const SizedBox(),
        SizedBox(
          height: isAddCar == true
              ? AppSize(context).height * 0.055
              : maxLine != null
                  ? null
                  : AppSize(context).height * 0.04,
          child: WidgetTextField(
            hint,
            textStyle: TextStyle(fontSize: AppSize(context).smallText3),
            controller: controller,
            padding:
                isAddCar == true ? const EdgeInsets.all(5) : EdgeInsets.zero,
            haveBorder: false,
            keyboardType: textInputType,
            maxLines: maxLine ?? 1,
            onTap: onTap,
            readOnly: readOnly ?? onTap != null ? true : false,
            suffixIcon: onTap != null
                ? isExpenses == true
                    ? Text(
                        'Add',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: AppSize(context).smallText4,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : const Icon(Icons.arrow_drop_down)
                : null,
          ),
        ),
        isLast == true
            ? const SizedBox()
            : Divider(
                height: 1,
                color: isAddCar == false
                    ? null
                    : AppColors.lightGreyColor.withOpacity(0.7),
              ),
        isLast == true
            ? const SizedBox()
            : SizedBox(height: AppSize(context).height * 0.01),
      ],
    );
  }
}
