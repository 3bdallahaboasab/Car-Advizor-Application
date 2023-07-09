import 'package:flutter/material.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/core/demo_date.dart';
import 'package:test/features/addCar/presentation/widgets/widget_part_card.dart';
import 'package:test/features/menu/presentation/widgets/widget_form_data.dart';

class SelectPartsScreen extends StatefulWidget {
  const SelectPartsScreen({super.key});

  @override
  State<SelectPartsScreen> createState() => _SelectPartsScreenState();
}

class _SelectPartsScreenState extends State<SelectPartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetFormData(
              title: 'Specification interior',
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
