class Pdv {
  int? id;
  String? code;
  String? lon;
  String? lalt;

  Pdv({this.id, this.code, this.lon, this.lalt});

  Map<String, dynamic> toMap() {
    return {"id": id, "code": code, "lon": lon, "lalt": lalt};
  }

  Pdv copy({
    int? id,
    String? code,
    String? lon,
    String? lalt,
  }) =>
      Pdv(
        id: id ?? this.id,
        code: code ?? this.code,
        lon: lon ?? this.lon,
        lalt: lalt ?? this.lalt,
      );
}
