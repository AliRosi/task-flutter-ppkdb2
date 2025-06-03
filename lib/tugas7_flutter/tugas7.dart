import 'package:flutter/material.dart';
import 'package:tugas1_flutter/helper/preference.dart';
import 'package:tugas1_flutter/tugas7_flutter/checkbox.dart';
import 'package:tugas1_flutter/tugas7_flutter/date_picker.dart';
import 'package:tugas1_flutter/tugas7_flutter/dropdown.dart';
import 'package:tugas1_flutter/tugas7_flutter/switch.dart';
import 'package:tugas1_flutter/tugas7_flutter/time_picker.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  Widget _currentScreen = CheckboxForm();
  int _selectedIndex = 0;

  void _setScreen(Widget screen, int index) {
    setState(() {
      _currentScreen = screen;
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas 7 Flutter", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      'assets/image/kucing-ragdoll_169.jpeg',
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ali Rosi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "PPKD BATCH 2",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text("Syarat & Ketentuan"),
              selected: _selectedIndex == 0,
              selectedTileColor: Colors.deepPurple.withValues(alpha: 0.2),
              onTap: () => _setScreen(CheckboxForm(), 0),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Mode Gelap"),
              selected: _selectedIndex == 1,
              selectedTileColor: Colors.deepPurple.withValues(alpha: 0.2),
              onTap: () => _setScreen(SwitchForm(), 1),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Pilih Kategori Produk"),
              selected: _selectedIndex == 2,
              selectedTileColor: Colors.deepPurple.withValues(alpha: 0.2),
              onTap: () => _setScreen(Dropdown(), 2),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Pilih Tanggal Lahir"),
              selected: _selectedIndex == 3,
              selectedTileColor: Colors.deepPurple.withValues(alpha: 0.2),
              onTap: () => _setScreen(DatePickerForm(), 3),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Atur Pengingat"),
              selected: _selectedIndex == 4,
              selectedTileColor: Colors.deepPurple.withValues(alpha: 0.2),
              onTap: () => _setScreen(TimePicker(), 4),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                await PreferenceHandler.deleteLogin();
                if (!context.mounted) return;
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }
}
