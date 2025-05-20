import 'package:flutter/material.dart';

class TugasSatu extends StatelessWidget {
  const TugasSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Profil Saya',style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 125, color: Colors.orange,),
          Text.rich(
            TextSpan(
              text: 'Ali ',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
              children: <TextSpan>[
                TextSpan(text: 'Rosi', style: TextStyle(color: Colors.orange)),
              ],
            )
          ),
          // Text('Ali Rosi',style: TextStyle(fontSize: 45, fontWeight: FontWeight.w500),),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.orange,),
              Text('Jakarta',),
            ],
          ),
          SizedBox(height: 10,),
          Text('Seorang pelajar yang sedang belajar Flutter.',style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}