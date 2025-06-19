import 'package:flutter/material.dart';

class ListTugasSembilan extends StatelessWidget {
  const ListTugasSembilan({super.key});

  final List kategori = const [
    {'nama': 'Buah-buahan'},
    {'nama': 'Sayuran'},
    {'nama': 'Elektronik'},
    {'nama': 'Pakaian Pria'},
    {'nama': 'Pakaian Wanita'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List')),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(kategori[index]['nama']));
        },
      ),
    );
  }
}
