import 'package:saropa_task/models/appearance_model.dart';
import 'package:saropa_task/models/biography_model.dart';
import 'package:saropa_task/models/connection_model.dart';
import 'package:saropa_task/models/image_model.dart';
import 'package:saropa_task/models/powerstats_model.dart';
import 'package:saropa_task/models/work_model.dart';

class SuperheroProfile {
  String? response;
  String? id;
  String? name;
  Powerstats? powerstats;
  Biography? biography;
  Appearance? appearance;
  Work? work;
  Connections? connections;
  ImageModel? image;

  SuperheroProfile({
    this.response,
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.appearance,
    this.work,
    this.connections,
    this.image,
  });

  SuperheroProfile.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    id = json['id'];
    name = json['name'];
    powerstats = json['powerstats'] != null
        ? Powerstats.fromJson(json['powerstats'])
        : null;
    biography = json['biography'] != null
        ? Biography.fromJson(json['biography'])
        : null;
    appearance = json['appearance'] != null
        ? Appearance.fromJson(json['appearance'])
        : null;
    work = json['work'] != null ? Work.fromJson(json['work']) : null;
    connections = json['connections'] != null
        ? Connections.fromJson(json['connections'])
        : null;
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['response'] = response;
    data['id'] = id;
    data['name'] = name;
    if (powerstats != null) {
      data['powerstats'] = powerstats!.toJson();
    }
    if (biography != null) {
      data['biography'] = biography!.toJson();
    }
    if (appearance != null) {
      data['appearance'] = appearance!.toJson();
    }
    if (work != null) {
      data['work'] = work!.toJson();
    }
    if (connections != null) {
      data['connections'] = connections!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
