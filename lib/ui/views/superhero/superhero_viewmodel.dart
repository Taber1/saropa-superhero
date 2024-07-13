import 'package:flutter/material.dart';
import 'package:saropa_task/app/app.locator.dart';
import 'package:saropa_task/app/app.router.dart';
import 'package:saropa_task/models/superhero_model.dart';
import 'package:saropa_task/repositories/superhero_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SuperheroViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  ScrollController scrollController = ScrollController();
  final superheroRepository = SuperheroRepository();

  int totalSuperHeroes = 731;
  int startId = 1;
  int count = 5;
  List<Superhero> superheroes = <Superhero>[];

  SuperheroViewModel() {
    scrollController.addListener(_scrollListener);
  }

  onInit() async {
    await fetchSuperheroes();
  }

  Future<void> fetchSuperheroes() async {
    busy(true);
    List<Superhero> newSuperheroes =
        await superheroRepository.fetchSuperheroes(startId, count);

    superheroes.addAll(newSuperheroes);
    startId += 5;
    busy(false);
    rebuildUi();
  }

  void navigateToSuperheroProfile(int id) {
    _navigationService.navigateToSuperheroProfileView(id: id);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // User has reached the end of the list, load more data
      if (superheroes.isNotEmpty && superheroes.length < totalSuperHeroes) {
        fetchSuperheroes();
      }
    }
  }
}
