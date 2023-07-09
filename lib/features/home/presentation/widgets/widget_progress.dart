import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:test/core/Functions/app_size.dart';

class CustomProgress extends StatelessWidget {
  final double value;
  final Color backGroundProgress;
  final Color colorProgress;
  const CustomProgress({
    super.key,
    required this.value,
    required this.backGroundProgress,
    required this.colorProgress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize(context).width * 0.19,
      height: AppSize(context).width * 0.19,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 270,
            endAngle: 270,
            radiusFactor: 0.8,
            axisLineStyle: AxisLineStyle(
              thickness: 0.35,
              color: backGroundProgress,
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: value,
                width: 0.35,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationDuration: 75,
                gradient: SweepGradient(
                  colors: [
                    colorProgress,
                    colorProgress,
                  ],
                  stops: const [0.25, 0.75],
                ),
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.2,
                widget: Text(
                  '$value%',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: AppSize(context).smallText4,
                      color: colorProgress,
                      overflow: TextOverflow.clip),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
