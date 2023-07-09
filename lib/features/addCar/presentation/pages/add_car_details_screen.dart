import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Functions/navigation.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/core/demo_date.dart';
import 'package:test/features/addCar/presentation/pages/select_data_screen.dart';
import 'package:test/features/menu/presentation/pages/my_store_screen.dart';
import 'package:test/features/menu/presentation/widgets/widget_language_list_tile.dart';

class AddCarDetailsScreen extends StatefulWidget {
  const AddCarDetailsScreen({super.key});

  @override
  State<AddCarDetailsScreen> createState() => _AddCarDetailsScreenState();
}

class _AddCarDetailsScreenState extends State<AddCarDetailsScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController costPrice = TextEditingController();
  TextEditingController sellPrice = TextEditingController();
  TextEditingController payment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Title
            CustomInputTextForm(
              title: 'Title',
              controller: title,
              isAddCar: true,
            ),
            // * Details (optional)
            CustomInputTextForm(
              title: 'Details (optional)',
              controller: details,
              isAddCar: true,
              maxLine: 3,
            ),
            // * Color
            CustomInputTextForm(
              title: 'Color',
              controller: color,
              isAddCar: true,
              onTap: () {
                Navigator.push(
                    context,
                    rightToLeft(SelectDataScreen(
                      title: 'Color',
                      textSearch: 'Search by color name',
                      haveIcon: true,
                      data: DemoData.allBrands,
                    )));
              },
            ),
            // * Cost price
            CustomInputTextForm(
              title: 'Cost price',
              controller: costPrice,
              isAddCar: true,
            ),
            // * Sell price
            CustomInputTextForm(
              title: 'Sell price',
              controller: sellPrice,
              isAddCar: true,
            ),
            // *Payment
            CustomInputTextForm(
              title: 'Payment method',
              controller: payment,
              isAddCar: true,
              onTap: () {
                selectData(
                  title: 'Vehicle status',
                  allText: [
                    {
                      'title': 'I',
                      'value': false,
                    },
                    {
                      'title': 'I Restyling',
                      'value': false,
                    }
                  ],
                );
              },
            ),
            // * Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show Price',
                  style: TextStyle(
                    fontSize: AppSize(context).smallText2,
                    color: AppColors.darkGreyColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (v) {},
                ),
              ],
            ),
            SizedBox(height: AppSize(context).height * 0.01),
            // * Upload Images
            Center(
              child: Text(
                'You can upload up to 10 pictures',
                style: TextStyle(
                  fontSize: AppSize(context).smallText2,
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: AppSize(context).height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Wrap(
                spacing: 10,
                children: [
                  // * Add Image
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: AppSize(context).width * 0.32,
                      width: AppSize(context).width * 0.32,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_circle_outline_outlined,
                          color: AppColors.blackColor1,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
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
