class Superhero {
  String? response;
  String? id;
  String? name;
  String? url;

  Superhero({
    this.response,
    this.id,
    this.name,
    this.url,
  });

  Superhero.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['response'] = response;
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
