import 'dart:ui';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'superhero_profile_viewmodel.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';
import 'package:saropa_task/utils/themes/app_theme.dart';
import 'package:saropa_task/provider/theme_provider.dart';
import 'package:saropa_task/utils/widgets/custom_dialog_loader.dart';
import 'package:saropa_task/ui/views/superhero_profile/widgets/work_section.dart';
import 'package:saropa_task/ui/views/superhero_profile/widgets/biography_section.dart';
import 'package:saropa_task/ui/views/superhero_profile/widgets/appearance_section.dart';
import 'package:saropa_task/ui/views/superhero_profile/widgets/connection_section.dart';
import 'package:saropa_task/ui/views/superhero_profile/widgets/power_stats_section.dart';

class SuperheroProfileView extends StackedView<SuperheroProfileViewModel> {
  final int id;
  const SuperheroProfileView(this.id, {Key? key}) : super(key: key);

  @override
  void onViewModelReady(SuperheroProfileViewModel viewModel) async {
    await viewModel.onInit(id);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SuperheroProfileViewModel viewModel,
    Widget? child,
  ) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final superhero = viewModel.superheroProfile;
    return Scaffold(
      body: superhero != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight(context) * 0.5,
                        child: Stack(
                          children: [
                            Container(
                              height: screenHeight(context) * 0.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    superhero.image!.url!,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 2.0, sigmaY: 2.0),
                                  child: Container(
                                    height: screenHeight(context) * 0.15,
                                    color: AppColors.transparentColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        heightFactor: 0.9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                width: screenWidth(context),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: themeProvider.themeData ==
                                          AppTheme.darkTheme
                                      ? AppColors.greyColorDark.withOpacity(0.7)
                                      : AppColors.greyColorLight
                                          .withOpacity(0.7),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      superhero.biography!.fullName!,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      superhero.name!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpaceMedium,
                              BiographySection(
                                  superhero,
                                  themeProvider.themeData ==
                                      AppTheme.darkTheme),
                              verticalSpaceMedium,
                              AppearanceSection(
                                  superhero: superhero,
                                  isDark: themeProvider.themeData ==
                                      AppTheme.darkTheme),
                              verticalSpaceMedium,
                              PowerStatsSection(
                                  superhero: superhero,
                                  isDark: themeProvider.themeData ==
                                      AppTheme.darkTheme),
                              verticalSpaceMedium,
                              WorkSection(
                                  superhero: superhero,
                                  isDark: themeProvider.themeData ==
                                      AppTheme.darkTheme),
                              verticalSpaceMedium,
                              ConnectionSection(
                                  superhero: superhero,
                                  isDark: themeProvider.themeData ==
                                      AppTheme.darkTheme),
                              verticalSpaceMassive,
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 15.0,
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.blackColor.withOpacity(0.5),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          : const Center(
              child: CustomDialogLoader(),
            ),
    );
  }

  @override
  SuperheroProfileViewModel viewModelBuilder(BuildContext context) =>
      SuperheroProfileViewModel();
}
