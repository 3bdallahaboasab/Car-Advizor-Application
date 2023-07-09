import 'package:flutter/material.dart';
import 'package:test/core/Functions/app_size.dart';
import 'package:test/core/Theme/color_constant.dart';
import 'package:test/features/home/presentation/widgets/widget_progress.dart';

class WidgetBoxProgress extends StatelessWidget {
  final String title;
  final String desc;
  final double value;
  final Color backGroundProgress;
  final Color colorProgress;

  const WidgetBoxProgress({
    super.key,
    required this.title,
    required this.desc,
    required this.value,
    required this.backGroundProgress,
    required this.colorProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomProgress(
            value: value,
            backGroundProgress: backGroundProgress,
            colorProgress: colorProgress,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppSize(context).smallText3,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: AppSize(context).width * 0.27,
                child: Text(
                  desc,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: AppSize(context).smallText5,
                      color: AppColors.greyColor2,
                      overflow: TextOverflow.clip),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
