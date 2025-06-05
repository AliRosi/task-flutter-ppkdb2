class LokasiModel {
  final int? id;
  final String nama;
  final double latitude;
  final double longitude;

  LokasiModel({
    this.id,
    required this.nama,
    required this.latitude,
    required this.longitude,
  });

  factory LokasiModel.fromMap(Map<String, dynamic> map) {
    return LokasiModel(
      id: map['id'],
      nama: map['nama'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
