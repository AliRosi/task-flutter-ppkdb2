import 'package:flutter/material.dart';

class TugasTujuh extends StatefulWidget {
  const TugasTujuh({super.key});

  @override
  State<TugasTujuh> createState() => _TugasTujuhState();
}

class _TugasTujuhState extends State<TugasTujuh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tugas 7 Flutter')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Tugas 7 Flutter',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(title: Text('Item 1'), onTap: () {}),
            ListTile(title: Text('Item 2'), onTap: () {}),
          ],
        ),
      ),
      body: Padding(padding: EdgeInsets.all(16)),
    );
  }
}
