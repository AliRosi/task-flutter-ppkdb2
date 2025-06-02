import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas9_flutter/list.dart';
import 'package:tugas1_flutter/tugas9_flutter/list_map.dart';
import 'package:tugas1_flutter/tugas9_flutter/model.dart';

class TugasSembilan extends StatelessWidget {
  const TugasSembilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas 9', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'List', ListTugasSembilan()),
            _buildButton(context, 'List Map', ListMapTugasSembilan()),
            _buildButton(context, 'Model', ModelTugasSembilan()),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
