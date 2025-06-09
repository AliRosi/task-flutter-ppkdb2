class LokasiModel {
  int? id;
  String nama;
  double latitude;
  double longitude;

  LokasiModel({
    this.id,
    required this.nama,
    required this.latitude,
    required this.longitude,
  });

  // Konversi dari Map ke objek LokasiModel
  factory LokasiModel.fromMap(Map<String, dynamic> map) {
    return LokasiModel(
      id: map['id'],
      nama: map['nama'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  // Konversi dari objek ke Map
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'nama': nama,
      'latitude': latitude,
      'longitude': longitude,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
