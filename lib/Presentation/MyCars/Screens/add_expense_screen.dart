import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/image_picker_class.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Presentation/AddCar/Components/widget_input_text_field_2.dart';
import 'package:test/Presentation/menu/Components/widget_language_list_tile.dart';
import 'package:test/Presentation/Components/widget_button.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController fuel = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController cost = TextEditingController();
  List<Map<String, dynamic>> allFuel = [
    {
      'title': 'Car Rental Fuel',
      'value': false,
    },
    {
      'title': 'Parking',
      'value': false,
    },
    {
      'title': 'Genral Maintenance',
      'value': false,
    },
    {
      'title': 'Insurance',
      'value': false,
    }
  ];
  String? text;
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: AppSize(context).width * 0.05,
          vertical: AppSize(context).height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * Fuel
          WidgetInputTextForm2(
            title: 'Fuel type',
            controller: fuel,
            onTap: () {
              selectData(
                title: 'Fuel type',
                allText: allFuel,
              );
            },
          ),
          // * Title
          WidgetInputTextForm2(
            title: 'Title',
            controller: title,
          ),
          // * Cost price
          WidgetInputTextForm2(
            title: 'Cost price',
            controller: cost,
          ),
          // * Attachment
          Text(
            'Attachment',
            style: TextStyle(
              fontSize: AppSize(context).smallText2,
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          image == null
              ? const SizedBox()
              : SizedBox(height: AppSize(context).height * 0.02),
          image == null
              ? const SizedBox()
              : Center(
                  child: Container(
                    width: AppSize(context).width * 0.3,
                    height: AppSize(context).width * 0.3,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(image!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
          image == null
              ? const SizedBox()
              : SizedBox(height: AppSize(context).height * 0.02),
          Center(
            child: TextButton(
              onPressed: () {
                pickImage(
                        context: context,
                        source: ImageSource.gallery,
                        needPath: true)
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      image = value;
                    });
                  }
                });
              },
              child: Text(
                'Add attachment',
                style: TextStyle(
                  fontSize: AppSize(context).smallText3,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  WidgetButton _buildBottomNavigationBar() {
    return WidgetButton(
      title: 'Confirm',
      color: AppColors.primaryColor,
      radius: 0,
      onTap: () {
        pop(context);
      },
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
        'Add expense',
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
                  'Close',
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

  void selectData(
      {required String title, required List<Map<String, dynamic>> allText}) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, set) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          insetPadding: const EdgeInsets.only(bottom: 20),
          contentPadding:
              EdgeInsets.symmetric(vertical: AppSize(context).height * 0.01),
          content: Builder(
            builder: (context) => SizedBox(
              width: AppSize(context).width * 0.2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize(context).width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // * Title
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: AppSize(context).mediumText4,
                            color: AppColors.blackColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    // * Body
                    SizedBox(
                      height: AppSize(context).height * 0.2,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: allText.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return WidgetLanguageListTile(
                            title: allText[index]['title'],
                            isActive: allText[index]['value'],
                            onTap: () {
                              for (var text in allText) {
                                set(() {
                                  text['value'] = false;
                                });
                              }
                              set(() {
                                allText[index]['value'] = true;
                                fuel.text = allText[index]['title'];
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    // * Button
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
                              pop(context);
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
              ),
            ),
          ),
        );
      }),
    );
  }
}
