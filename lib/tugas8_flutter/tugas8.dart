import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas7_flutter/tugas7.dart';

class TugasDelapan extends StatefulWidget {
  const TugasDelapan({super.key});

  @override
  State<TugasDelapan> createState() => _TugasDelapanState();
}

class _TugasDelapanState extends State<TugasDelapan> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const TugasTujuh(), const AboutPage()];

  // final List<String> _titles = ['Home', 'Tentang Aplikasi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Aplikasi ini dibuat sebagai tugas Flutter 7 & 8 yang menampilkan form input interaktif dengan Drawer, dan navigasi bawah menggunakan BottomNavigationBar.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text('Developer: Ali Rosi', style: TextStyle(fontSize: 16)),
          Text(
            'Versi: 1.0.0',
            style: TextStyle(fontSize: 16, color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}
