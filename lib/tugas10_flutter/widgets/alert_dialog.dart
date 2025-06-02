import 'package:flutter/material.dart';

class AlertDialogSummary extends StatelessWidget {
  final String nama;
  final String email;
  final String hp;
  final String kota;
  final VoidCallback onLanjut;

  const AlertDialogSummary({
    super.key,
    required this.nama,
    required this.email,
    required this.hp,
    required this.kota,
    required this.onLanjut,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        'Ringkasan Data',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('👤 Nama : $nama'),
          Text('📧 Email : $email'),
          Text('📱 No HP : ${hp.isNotEmpty ? hp : "-"}'),
          Text('🏙️ Kota : $kota'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            onLanjut();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text('Lanjut', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
