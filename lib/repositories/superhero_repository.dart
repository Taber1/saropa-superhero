import 'package:saropa_task/app/app.locator.dart';
import 'package:saropa_task/models/superhero_model.dart';
import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/services/api_service.dart';
import 'package:saropa_task/services/local_storage_service.dart';

class SuperheroRepository {
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();

  Future<Superhero> fetchSuperhero(int id) async {
    final cachedSuperhero = _localStorageService.getSuperhero(id.toString());
    if (cachedSuperhero != null) {
      return cachedSuperhero;
    }

    Map<String, dynamic> response = await _apiService.get('$id/image');
    if (response['response'] == 'success') {
      final superhero = Superhero.fromJson(response);
      await _localStorageService.saveSuperhero(superhero);
      return superhero;
    } else {
      throw Exception('Failed to load superhero');
    }
  }

  Future<List<Superhero>> fetchSuperheroes(int startId, int count) async {
    List<Superhero> superheroes = [];
    for (int i = startId; i < startId + count; i++) {
      Superhero superhero = await fetchSuperhero(i);
      superheroes.add(superhero);
    }
    return superheroes;
  }

  Future<SuperheroProfile> fetchSuperheroProfile(int id) async {
    final cachedProfile = _localStorageService.getSuperheroProfile(id);
    if (cachedProfile != null) {
      return cachedProfile;
    }

    Map<String, dynamic> response = await _apiService.get('$id');
    if (response['response'] == 'success') {
      final profile = SuperheroProfile.fromJson(response);
      await _localStorageService.saveSuperheroProfile(profile);
      return profile;
    } else {
      throw Exception('Failed to load superhero profile');
    }
  }
}
