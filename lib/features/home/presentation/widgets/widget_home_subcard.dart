import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/home/presentation/widgets/widget_home_card.dart';

class WidgetHomeSubCard extends StatelessWidget {
  final String title;
  final String counts;
  final Color colorFirstIcon;
  final Widget firstIcon;
  final Widget sacundIcon;
  final bool? isSacundCard;
  final Function()? onTap;
  const WidgetHomeSubCard({
    super.key,
    required this.title,
    required this.counts,
    required this.firstIcon,
    required this.sacundIcon,
    required this.colorFirstIcon,
    this.isSacundCard = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: isSacundCard == true ? onTap : null,
        child: WidgetHomeCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: colorFirstIcon,
                      borderRadius: BorderRadius.circular(100000),
                    ),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: firstIcon,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: AppSize(context).smallText3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      counts,
                      style: TextStyle(
                        fontSize: AppSize(context).smallText1,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: AppSize(context).width * 0.15,
                      height: AppSize(context).height * 0.02,
                      child: sacundIcon,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
