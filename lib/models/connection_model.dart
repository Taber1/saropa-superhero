class Connections {
  String? groupAffiliation;
  String? relatives;

  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  Connections.fromJson(Map<String, dynamic> json) {
    groupAffiliation = json['group-affiliation'];
    relatives = json['relatives'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['group-affiliation'] = groupAffiliation;
    data['relatives'] = relatives;
    return data;
  }
}
