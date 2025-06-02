class ProdukModel {
  final String nama;
  final String deskripsi;
  final String gambar;

  const ProdukModel({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });
}

const List<ProdukModel> daftarSayuran = [
  ProdukModel(
    nama: 'Bayam',
    deskripsi: 'Kaya zat besi dan serat, baik untuk daya tahan tubuh.',
    gambar: 'assets/image/bayam.jpg',
  ),
  ProdukModel(
    nama: 'Wortel',
    deskripsi: 'Beta-karoten tinggi, baik untuk mata dan kulit.',
    gambar: 'assets/image/wortel.jpeg',
  ),
  ProdukModel(
    nama: 'Kubis',
    deskripsi: 'Kaya vitamin C dan antioksidan.',
    gambar: 'assets/image/kubis.jpg',
  ),
  ProdukModel(
    nama: 'Sawi',
    deskripsi: 'Tinggi serat dan vitamin K.',
    gambar: 'assets/image/sawi.jpg',
  ),
  ProdukModel(
    nama: 'Kangkung',
    deskripsi: 'Kaya magnesium dan zat besi.',
    gambar: 'assets/image/kangkung.jpg',
  ),
  ProdukModel(
    nama: 'Buncis',
    deskripsi: 'Renyah dan kaya protein nabati.',
    gambar: 'assets/image/buncis.jpg',
  ),
  ProdukModel(
    nama: 'Terong',
    deskripsi: 'Lembut saat dimasak, cocok untuk balado.',
    gambar: 'assets/image/terong.jpg',
  ),
  ProdukModel(
    nama: 'Tomat',
    deskripsi: 'Sumber vitamin C dan likopen.',
    gambar: 'assets/image/tomat.png',
  ),
  ProdukModel(
    nama: 'Mentimun',
    deskripsi: 'Segar dan kaya air.',
    gambar: 'assets/image/mentimun.jpg',
  ),
  ProdukModel(
    nama: 'Paprika',
    deskripsi: 'Warna cerah, kaya vitamin A dan C.',
    gambar: 'assets/image/paprika.jpg',
  ),
];
