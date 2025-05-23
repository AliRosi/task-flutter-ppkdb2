import 'package:flutter/material.dart';

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  String? displayedName;
  bool isLiked = false;
  bool showDescription = false;
  int counter = 0;
  bool showInkWellText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Interaktif')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (displayedName == null) {
                      displayedName = "Ali Rosi";
                    } else {
                      displayedName = null;
                    }
                  });
                },
                child: Text("Tampilkan Nama"),
              ),
              if (displayedName != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    displayedName!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),

              SizedBox(height: 24),

              // IconButton
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  if (isLiked) Text("Suka", style: TextStyle(fontSize: 16)),
                ],
              ),

              SizedBox(height: 24),

              // TextButton
              TextButton(
                onPressed: () {
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
                child: Text(
                  showDescription
                      ? "Sembunyikan Selengkapnya"
                      : "Lihat Selengkapnya",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (showDescription)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("I Love You", style: TextStyle(fontSize: 16)),
                ),

              SizedBox(height: 24),

              // InkWell
              InkWell(
                onTap: () {
                  setState(() {
                    showInkWellText = !showInkWellText;
                  });
                  print("Miawww");
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF202C33),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        "assets/image/kucing-ragdoll_169.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (showInkWellText)
                      Text(
                        "Miawww",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // GestureDetector
              GestureDetector(
                onTap: () => print("Ditekan sekali"),
                onDoubleTap: () => print("Ditekan dua kali"),
                onLongPress: () => print("Tahan lama"),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Tekan Aku", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Counter: $counter",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
