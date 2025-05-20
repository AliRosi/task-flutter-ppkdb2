import 'package:flutter/material.dart';

class TugasDua extends StatelessWidget {
  const TugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Lengkap', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CircleAvatar(
            radius: 66,
            backgroundImage: AssetImage("assets/image/kucing-ragdoll_169.jpeg"),
          ),
          SizedBox(height: 30),
          Center(
            child: Text(
              'Ali Rosi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('alirosi3241@gmail.com'),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: Colors.greenAccent),
                Spacer(),
                // SizedBox(width: 10),
                Text('0812-3456-7890'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.blue[100],
                    child: Center(child: Text('Postingan')),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.green[100],
                    child: Center(child: Text('Followers')),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Saya adalah mahasiswa yang senang belajar Flutter dan membuat aplikasi mobile yang bermanfaat. Saya adalah mahasiswa yang senang belajar Flutter dan membuat aplikasi mobile yang bermanfaat. Saya adalah mahasiswa yang senang belajar Flutter dan membuat aplikasi mobile yang bermanfaat. Saya adalah mahasiswa yang senang belajar Flutter dan membuat aplikasi mobile yang bermanfaat.',
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.pink[100],
                  child: Center(child: Text('@Instagram')),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.purple[100],
                  child: Center(child: Text('LinkedIn'),),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
