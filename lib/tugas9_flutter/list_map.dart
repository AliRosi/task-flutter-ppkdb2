import 'package:flutter/material.dart';

class ListMapTugasSembilan extends StatelessWidget {
  const ListMapTugasSembilan({super.key});

  final List<Map<String, dynamic>> kategori = const [
    {'nama': 'Buah-buahan', 'icon': Icons.apple},
    {'nama': 'Sayuran', 'icon': Icons.grass},
    {'nama': 'Elektronik', 'icon': Icons.devices},
    {'nama': 'Pakaian Pria', 'icon': Icons.man},
    {'nama': 'Pakaian Wanita', 'icon': Icons.woman},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Map')),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(kategori[index]['icon']),
            title: Text(kategori[index]['nama']),
          );
        },
      ),
    );
  }
}
