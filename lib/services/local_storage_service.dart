import 'dart:convert';

import 'package:saropa_task/models/superhero_model.dart';
import 'package:saropa_task/models/superhero_profile_model.dart';
import 'package:saropa_task/utils/storage/local_storage.dart';

class LocalStorageService {
  static const String _superheroesKey = 'superheroes';
  static const String _superheroProfileKeyPrefix = 'superhero_profile_';

  Future<void> saveSuperheroes(List<Superhero> superheroes) async {
    final jsonString = jsonEncode(superheroes);
    await LocalStorage.setString(_superheroesKey, jsonString);
  }

  List<Superhero> getSuperheroes() {
    final jsonString = LocalStorage.getString(_superheroesKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => Superhero.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveSuperhero(Superhero superhero) async {
    final superheroes = getSuperheroes();
    superheroes.add(superhero);
    await saveSuperheroes(superheroes);
  }

  Superhero? getSuperhero(String id) {
    final superheroes = getSuperheroes();
    if (superheroes.isNotEmpty) {
      try {
        return superheroes.firstWhere((hero) => hero.id == id);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> saveSuperheroProfile(SuperheroProfile profile) async {
    final key = '$_superheroProfileKeyPrefix${profile.id}';
    final jsonString = jsonEncode(profile.toJson());
    await LocalStorage.setString(key, jsonString);
  }

  SuperheroProfile? getSuperheroProfile(int id) {
    final key = '$_superheroProfileKeyPrefix$id';
    final jsonString = LocalStorage.getString(key);
    if (jsonString != null) {
      return SuperheroProfile.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
