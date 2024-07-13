class Work {
  String? occupation;
  String? base;

  Work({this.occupation, this.base});

  Work.fromJson(Map<String, dynamic> json) {
    occupation = json['occupation'];
    base = json['base'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['occupation'] = occupation;
    data['base'] = base;
    return data;
  }
}
