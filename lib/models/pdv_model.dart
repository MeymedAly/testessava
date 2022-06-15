class Pdv {
  int? id;
  String? code;
  double? lon;
  double? lalt;

  Pdv({this.id, this.code, this.lon, this.lalt});

  Map<String, dynamic> toMap() {
    return {"id": id, "code": code, "lon": lon, "lalt": lalt};
  }
}
