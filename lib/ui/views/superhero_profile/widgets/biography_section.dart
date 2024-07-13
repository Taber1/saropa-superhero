import 'package:flutter/material.dart';
import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';

class BiographySection extends StatelessWidget {
  final SuperheroProfile superhero;
  final bool isDark;

  const BiographySection(this.superhero, this.isDark, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.centerLeft,
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
            'Biography',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          verticalSpaceSmall,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "- Publisher: ",
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: superhero.biography!.publisher!,
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                  ),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "- Place of Birth: ",
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: superhero.biography!.placeOfBirth!,
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                  ),
                )
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "- First Appearance: ",
                  style: TextStyle(
                    color: isDark ? AppColors.whiteColor : AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextSpan(
                  text: superhero.biography!.firstAppearance!,
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
