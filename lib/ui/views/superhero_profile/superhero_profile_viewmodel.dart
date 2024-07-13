import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/repositories/superhero_repository.dart';
import 'package:stacked/stacked.dart';

class SuperheroProfileViewModel extends BaseViewModel {
  final superheroRepository = SuperheroRepository();
  SuperheroProfile? superheroProfile;

  onInit(int id) async {
    await fetchSuperheroProfile(id);
  }

  fetchSuperheroProfile(int id) async {
    superheroProfile = await superheroRepository.fetchSuperheroProfile(id);
    rebuildUi();
  }
}
