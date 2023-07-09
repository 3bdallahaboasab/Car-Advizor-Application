import 'package:flutter/material.dart';
import 'package:test/Data/Functions/app_size.dart';
import 'package:test/Data/Functions/navigation.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Data/demo_date.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test/Presentation/AddCar/Components/widget_input_text_field_2.dart';
import 'package:test/Presentation/AddCar/Screens/select_data_screen.dart';

import 'package:test/Presentation/menu/Components/widget_language_list_tile.dart';

class AddCarInformationScreen extends StatefulWidget {
  const AddCarInformationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddCarInformationScreenState();
}

class _AddCarInformationScreenState extends State<AddCarInformationScreen> {
  TextEditingController vin = TextEditingController();

  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool isActive6 = false;
  bool isActive7 = false;
  bool isActive8 = false;
  bool isActive9 = false;
  bool isActive10 = false;
  bool isActive11 = false;

  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)!;

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetInputTextForm2(
              title: lang.vinNumber,
              controller: vin,
              hint: '${lang.ex} : 4Y1SL65848Z411439',
            ),
            WidgetInputTextForm2(
              title: lang.brands,
              controller: vin,
              onTap: () {
                setState(() {
                  isActive1 = true;
                });
                Navigator.push(
                    context,
                    rightToLeft(SelectDataScreen(
                      title: lang.brands,
                      textSearch: 'Search by brand name',
                      haveIcon: true,
                      data: DemoData.allBrands,
                    )));
              },
            ),
            WidgetInputTextForm2(
              title: lang.model,
              controller: vin,
              isActive: isActive1,
              onTap: () {
                setState(() {
                  isActive2 = true;
                });
                Navigator.push(
                    context,
                    rightToLeft(SelectDataScreen(
                      title: lang.model,
                      textSearch: 'Search by model name',
                      data: DemoData.carModels,
                    )));
              },
            ),
            WidgetInputTextForm2(
              title: lang.year,
              controller: vin,
              isActive: isActive2,
              onTap: () {
                setState(() {
                  isActive3 = true;
                });
                Navigator.push(
                    context,
                    rightToLeft(SelectDataScreen(
                      title: lang.year,
                      textSearch: 'Search by tear name',
                      data: DemoData.years,
                    )));
              },
            ),
            WidgetInputTextForm2(
              title: lang.body,
              controller: vin,
              isActive: isActive3,
              onTap: () {
                setState(() {
                  isActive4 = true;
                });
                Navigator.push(
                    context,
                    rightToLeft(SelectDataScreen(
                      title: lang.body,
                      textSearch: 'Search by body name',
                      data: DemoData.body,
                    )));
              },
            ),
            WidgetInputTextForm2(
              title: lang.trim,
              controller: vin,
              isActive: isActive4,
              onTap: () {
                selectData(
                  title: lang.trim,
                  allText: [
                    {
                      'title': 'Flying Spur',
                      'value': false,
                    },
                    {
                      'title': 'I',
                      'value': false,
                    },
                    {
                      'title': 'II',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive5 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.bodyCondition,
              controller: vin,
              isActive: isActive5,
              onTap: () {
                selectData(
                  title: lang.bodyCondition,
                  allText: [
                    {
                      'title': 'Excellent With no defects',
                      'value': false,
                    },
                    {
                      'title': 'fair (body needs work)',
                      'value': false,
                    },
                    {
                      'title': 'Poor (server body damages)',
                      'value': false,
                    },
                    {
                      'title': 'Others',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive6 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.carPaintConditin,
              controller: vin,
              isActive: isActive6,
              onTap: () {
                selectData(
                  title: lang.carPaintConditin,
                  allText: [
                    {
                      'title': 'Orginal Paint',
                      'value': false,
                    },
                    {
                      'title': 'Total repaint',
                      'value': false,
                    },
                    {
                      'title': 'Others',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive7 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.regionalSpecification,
              controller: vin,
              isActive: isActive7,
              onTap: () {
                selectData(
                  title: lang.regionalSpecification,
                  allText: [
                    {
                      'title': 'Amircan Spaces',
                      'value': false,
                    },
                    {
                      'title': 'GCC Spaces',
                      'value': false,
                    },
                    {
                      'title': 'Other Spaces',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive8 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.transmissionType,
              controller: vin,
              isActive: isActive8,
              onTap: () {
                selectData(
                  title: lang.transmissionType,
                  allText: [
                    {
                      'title': 'Automatic',
                      'value': false,
                    },
                    {
                      'title': 'Manual',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive9 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.vehicleStatus,
              controller: vin,
              isActive: isActive9,
              onTap: () {
                selectData(
                  title: lang.vehicleStatus,
                  allText: [
                    {
                      'title': 'New',
                      'value': false,
                    },
                    {
                      'title': 'Used',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive10 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.fuelType,
              controller: vin,
              isActive: isActive10,
              onTap: () {
                selectData(
                  title: lang.fuelType,
                  allText: [
                    {
                      'title': 'Diesel',
                      'value': false,
                    },
                    {
                      'title': 'Electric',
                      'value': false,
                    }
                  ],
                );
                setState(() {
                  isActive11 = true;
                });
              },
            ),
            WidgetInputTextForm2(
              title: lang.engineSize,
              isActive: isActive11,
              controller: vin,
            ),
            WidgetInputTextForm2(
              title: lang.mileage,
              controller: vin,
            ),
            WidgetInputTextForm2(
              title: lang.clinders,
              controller: vin,
            ),
          ],
        ),
      ),
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
              ),
            ),
          ),
        );
      }),
    );
  }
}
