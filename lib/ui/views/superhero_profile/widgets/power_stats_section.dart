import 'package:flutter/material.dart';
import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PowerStatsSection extends StatelessWidget {
  final SuperheroProfile superhero;
  final bool isDark;
  const PowerStatsSection({
    super.key,
    required this.superhero,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isDark
            ? AppColors.greyColorDark.withOpacity(0.7)
            : AppColors.greyColorLight.withOpacity(0.7),
      ),
      child: Column(
        children: [
          _powerStatsSection(context, superhero),
        ],
      ),
    );
  }

  Widget _powerStatsSection(BuildContext context, SuperheroProfile superhero) {
    return Column(
      children: [
        const Text(
          'Power Stats',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            powerStats(
                context, "Intelligence", superhero.powerstats!.intelligence!),
            powerStats(context, "Strength", superhero.powerstats!.strength!),
            powerStats(context, "Speed", superhero.powerstats!.speed!),
            powerStats(
                context, "Durability", superhero.powerstats!.durability!),
          ],
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            powerStats(context, "Power", superhero.powerstats!.power!),
            powerStats(context, "Combat", superhero.powerstats!.combat!),
          ],
        ),
      ],
    );
  }

  Widget powerStats(BuildContext context, String title, String value) {
    double range = value != "null" ? double.parse(value) : 0;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 100,
          width: screenWidth(context) * 0.2,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(
                showTicks: false,
                showLabels: false,
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text(
                      '$range',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  )
                ],
                axisLineStyle: const AxisLineStyle(
                  thickness: 0.1,
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: range,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    gradient: SweepGradient(
                      colors: _getGradientColors(range),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -3,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getResponsiveFontSize(context, fontSize: 40, max: 50),
            ),
          ),
        ),
      ],
    );
  }

  List<Color> _getGradientColors(double value) {
    if (value > 75) {
      return const [Color(0xFF00FF00), Color(0xFF008000)]; // Green gradients
    } else if (value > 50) {
      return const [Color(0xFFFFFF00), Color(0xFFFFD700)]; // Yellow gradients
    } else if (value > 25) {
      return const [Color(0xFFFFA500), Color(0xFFFF8C00)]; // Orange gradients
    } else {
      return const [Color(0xFFFF0000), Color(0xFF8B0000)]; // Red gradients
    }
  }
}
