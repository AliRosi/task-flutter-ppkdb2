import 'package:flutter/material.dart';
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

  void _setScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
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
              onTap: () => _setScreen(CheckboxForm()),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Mode Gelap"),
              onTap: () => _setScreen(SwitchForm()),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Pilih Kategori Produk"),
              onTap: () => _setScreen(Dropdown()),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Pilih Tanggal Lahir"),
              onTap: () => _setScreen(DatePickerForm()),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("Atur Pengingat"),
              onTap: () => _setScreen(TimePicker()),
            ),
          ],
        ),
      ),
      body: _currentScreen,
    );
  }
}
