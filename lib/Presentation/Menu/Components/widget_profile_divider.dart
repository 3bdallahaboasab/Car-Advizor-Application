import 'package:flutter/material.dart';

class WidgetProfileDivider extends StatelessWidget {
  const WidgetProfileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        height: 7,
      ),
    );
  }
}
