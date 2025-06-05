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
      final latitude = double.parse(latitudeController.text);
      final longitude = double.parse(longitudeController.text);

      final lokasiBaru = LokasiModel(
        nama: namaController.text,
        latitude: latitude,
        longitude: longitude,
      );

      await DbHelperLokasi().insertLokasi(lokasiBaru);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Lokasi berhasil disimpan!')),
          backgroundColor: Colors.green,
        ),
      );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          "📍Tambah Lokasi Favorit",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Formulir Lokasi Favorit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(namaController, "Nama Lokasi"),
                    const SizedBox(height: 16),
                    _buildTextField(
                      latitudeController,
                      "Latitude",
                      isNumeric: true,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      longitudeController,
                      "Longitude",
                      isNumeric: true,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          simpanLokasi();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Simpan Lokasi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Daftar Lokasi Favorit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    lokasiList.isEmpty
                        ? const Text("Belum ada data.")
                        : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lokasiList.length,
                          itemBuilder: (context, index) {
                            final lokasi = lokasiList[index];
                            return Card(
                              child: ListTile(
                                title: Text('📍 ${lokasi.nama}'),
                                subtitle: Text(
                                  'Lat: ${lokasi.latitude}, Long: ${lokasi.longitude}',
                                ),
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
        if (value == null || value.isEmpty) {
          return '$label tidak boleh kosong';
        }
        if (isNumeric) {
          final number = double.tryParse(value);
          if (number == null) {
            return '$label harus berupa angka yang valid';
          }
        }
        return null;
      },
      controller: controller,
      keyboardType:
          isNumeric
              ? const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              )
              : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[800]),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
