import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saropa_task/provider/theme_provider.dart';
import 'package:saropa_task/ui/common/app_colors.dart';
import 'package:saropa_task/ui/common/ui_helpers.dart';
import 'package:saropa_task/utils/themes/app_theme.dart';
import 'package:saropa_task/utils/widgets/custom_dialog_loader.dart';
import 'package:stacked/stacked.dart';

import 'superhero_viewmodel.dart';

class SuperheroView extends StackedView<SuperheroViewModel> {
  const SuperheroView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(SuperheroViewModel viewModel) async {
    viewModel.onInit();
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    SuperheroViewModel viewModel,
    Widget? child,
  ) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Superheroes',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: themeProvider.themeData == AppTheme.darkTheme
                ? const Icon(Icons.sunny)
                : const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: viewModel.superheroes.isNotEmpty
          ? ListView.builder(
              cacheExtent: 9999,
              controller: viewModel.scrollController,
              itemCount:
                  viewModel.superheroes.length + (viewModel.isBusy ? 1 : 0),
              itemBuilder: (context, index) {
                if (index + 1 == viewModel.superheroes.length) {
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        verticalSpaceMedium,
                      ],
                    ),
                  );
                }
                final superhero = viewModel.superheroes[index];
                return GestureDetector(
                  onTap: () {
                    viewModel
                        .navigateToSuperheroProfile(int.parse(superhero.id!));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: screenWidth(context),
                    height: screenHeight(context) * 0.25,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(superhero.url!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor
                                          .withOpacity(0.0)),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Image.network(
                              superhero.url!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: themeProvider.themeData ==
                                      AppTheme.darkTheme
                                  ? AppColors.greyColorDark.withOpacity(0.7)
                                  : AppColors.greyColorLight.withOpacity(0.7),
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                superhero.name!,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CustomDialogLoader(),
            ),
    );
  }

  @override
  SuperheroViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuperheroViewModel();
}
