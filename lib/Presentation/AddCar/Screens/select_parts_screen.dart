import 'package:flutter/material.dart';
import 'package:test/Data/Theme/color_constant.dart';
import 'package:test/Data/demo_date.dart';
import 'package:test/Presentation/AddCar/Components/widget_part_card.dart';
import 'package:test/Presentation/menu/Components/widget_form_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectPartsScreen extends StatefulWidget {
  const SelectPartsScreen({super.key});

  @override
  State<SelectPartsScreen> createState() => _SelectPartsScreenState();
}

class _SelectPartsScreenState extends State<SelectPartsScreen> {
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
            WidgetFormData(
              title: lang.spicificationInterior,
              isAddCar: true,
              children: DemoData.allParts
                  .map<Widget>(
                    (e) => WedgitPartCard(
                      icon: Icon(
                        e['icon'],
                        size: 30,
                        color: AppColors.blackColor1,
                      ),
                      title: e['title'],
                      value: e['value'],
                      onChange: (value) {
                        setState(() {
                          e['value'] = value;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
