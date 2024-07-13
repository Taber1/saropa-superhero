import 'package:flutter/material.dart';
import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';

class ConnectionSection extends StatelessWidget {
  final SuperheroProfile superhero;
  final bool isDark;
  const ConnectionSection({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connections',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          verticalSpaceSmall,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "- Group Affiliation: ",
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: superhero.connections!.groupAffiliation,
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
