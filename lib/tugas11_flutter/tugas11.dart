import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas11_flutter/database/db_helper_lokasi.dart';
import 'package:tugas1_flutter/tugas11_flutter/model/lokasi_model.dart';

class LokasiFavoritScreen extends StatefulWidget {
  const LokasiFavoritScreen({super.key});
  static const String id = '/lokasi_favorit_screen';

  @override
  State<LokasiFavoritScreen> createState() => _LokasiFavoritScreenState();
}

class _LokasiFavoritScreenState extends State<LokasiFavoritScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  List<LokasiModel> lokasiList = [];

  @override
  void initState() {
    super.initState();
    _loadLokasi();
  }

  Future<void> _loadLokasi() async {
    final data = await DbHelperLokasi().getAllLokasi();
    setState(() {
      lokasiList = data;
    });
  }

  Future<void> simpanLokasi() async {
    if (_formKey.currentState!.validate()) {
      final lokasiBaru = LokasiModel(
        nama: namaController.text,
        latitude: double.parse(latitudeController.text),
        longitude: double.parse(longitudeController.text),
      );
      await DbHelperLokasi().insertLokasi(lokasiBaru);

      // ignore: avoid_print
      print(
        'Lokasi disimpan:🟢 Nama: ${lokasiBaru.nama}, '
        'Latitude: ${lokasiBaru.latitude}, Longitude: ${lokasiBaru.longitude}',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Lokasi berhasil disimpan!')),
          backgroundColor: Colors.green,
        ),
      );

      namaController.clear();
      latitudeController.clear();
      longitudeController.clear();

      _loadLokasi();
    }
  }

  void _tampilkanDialogEdit(LokasiModel lokasi) {
    final TextEditingController editNama = TextEditingController(
      text: lokasi.nama,
    );
    final TextEditingController editLat = TextEditingController(
      text: lokasi.latitude.toString(),
    );
    final TextEditingController editLong = TextEditingController(
      text: lokasi.longitude.toString(),
    );

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Text("Edit Lokasi"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(editNama, "Nama Lokasi"),
                SizedBox(height: 10),
                _buildTextField(editLat, "Latitude", isNumeric: true),
                SizedBox(height: 10),
                _buildTextField(editLong, "Longitude", isNumeric: true),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Batal", style: TextStyle(color: Colors.grey[700])),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  final lokasiEdit = LokasiModel(
                    id: lokasi.id,
                    nama: editNama.text,
                    latitude: double.parse(editLat.text),
                    longitude: double.parse(editLong.text),
                  );
                  await DbHelperLokasi().updateLokasi(lokasiEdit);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text('Lokasi berhasil diperbarui!'),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  _loadLokasi();
                },
                child: Text("Simpan", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
    );
  }

  void _hapusLokasi(int id) async {
    await DbHelperLokasi().deleteLokasi(id);

    // ignore: avoid_print
    print('Lokasi dengan ID $id telah dihapus.');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text('Lokasi berhasil dihapus!')),
        backgroundColor: Colors.red,
      ),
    );
    _loadLokasi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          "📍Tambah Lokasi Favorit",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Formulir Lokasi Favorit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildTextField(namaController, "Nama Lokasi"),
                    SizedBox(height: 16),
                    _buildTextField(
                      latitudeController,
                      "Latitude",
                      isNumeric: true,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      longitudeController,
                      "Longitude",
                      isNumeric: true,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: simpanLokasi,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Simpan Lokasi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Daftar Lokasi Favorit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    lokasiList.isEmpty
                        ? Text("Belum ada data.")
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: lokasiList.length,
                          itemBuilder: (context, index) {
                            final lokasi = lokasiList[index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.teal,
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lokasi.nama,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Latitude: ${lokasi.latitude}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          'Longitude: ${lokasi.longitude}',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.orange,
                                        ),
                                        onPressed:
                                            () => _tampilkanDialogEdit(lokasi),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed:
                                            () => _hapusLokasi(lokasi.id!),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool isNumeric = false,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) return '$label tidak boleh kosong';
        if (isNumeric && double.tryParse(value) == null)
          return '$label harus berupa angka';
        return null;
      },
      controller: controller,
      keyboardType:
          isNumeric
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.teal),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
