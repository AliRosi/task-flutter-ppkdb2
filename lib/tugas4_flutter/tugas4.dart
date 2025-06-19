import 'package:flutter/material.dart';

class TugasEmpat extends StatelessWidget {
  const TugasEmpat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir & Produk', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildTextField(
            label: "Nama",
            keyboardType: TextInputType.name,
            icon: Icons.person,
          ),
          SizedBox(height: 16),
          _buildTextField(
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
          ),
          SizedBox(height: 16),
          _buildTextField(
            label: "No. HP",
            keyboardType: TextInputType.phone,
            icon: Icons.phone,
          ),
          SizedBox(height: 16),
          _buildTextField(
            label: "Deskripsi",
            keyboardType: TextInputType.text,
            isDescription: true,
          ),
          SizedBox(height: 24),
          Text(
            'Daftar Produk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),

          // List Produk
          _buildProductItem(
            "Nissan Skyline R34",
            "Rp2.000.000.000",
            "assets/image/r34.png",
          ),
          _buildProductItem(
            "Toyota Supra MK4",
            "2.600.000.000",
            "assets/image/supra_mk4.png",
          ),
          _buildProductItem(
            "Esemka Garuda 1 SUV",
            "-",
            "assets/image/esemka.jpeg",
          ),
          _buildProductItem(
            "Nissan Silvia S15",
            "1.000.000.000",
            "assets/image/s15.png",
          ),
          _buildProductItem(
            "Toyota GR Supra",
            "Rp2.268.000.000",
            "assets/image/gr_supra.png",
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    TextInputType? keyboardType,
    IconData? icon,
    bool isDescription = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        keyboardType: keyboardType ?? TextInputType.text,
        maxLines: isDescription ? 3 : 1,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.blueAccent),
          prefixIcon: icon != null ? Icon(icon, color: Colors.blue) : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: "Masukkan $label",
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildProductItem(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          onTap: () {},
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey[400]),
        ),
      ),
    );
  }
}
