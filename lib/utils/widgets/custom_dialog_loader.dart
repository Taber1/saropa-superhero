import 'package:flutter/material.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';

class CustomDialogLoader extends StatelessWidget {
  final bool showText;

  const CustomDialogLoader({
    super.key,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return showText
        ? Dialog(
            elevation: 0,
            backgroundColor: AppColors.transparentColor,
            child: Container(
              height: screenHeight(context) * 0.1,
              width: screenWidth(context) * 0.8,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  horizontalSpaceLarge,
                  CircularProgressIndicator(),
                  horizontalSpaceLarge,
                  Text(
                    "Loading ...",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ))
        : SizedBox(
            width: 180,
            child: Dialog(
              elevation: 0,
              backgroundColor: AppColors.transparentColor,
              child: Container(
                height: 100,
                // width: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const CircularProgressIndicator(),
              ),
            ),
          );
  }
}
