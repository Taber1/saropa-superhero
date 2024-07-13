class Appearance {
  String? gender;
  String? race;
  List<String>? height;
  List<String>? weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  Appearance.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    race = json['race'];
    height = json['height'].cast<String>();
    weight = json['weight'].cast<String>();
    eyeColor = json['eye-color'];
    hairColor = json['hair-color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['gender'] = gender;
    data['race'] = race;
    data['height'] = height;
    data['weight'] = weight;
    data['eye-color'] = eyeColor;
    data['hair-color'] = hairColor;
    return data;
  }
}
