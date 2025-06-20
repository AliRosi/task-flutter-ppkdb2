import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas15_flutter/api/user_api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                "Buat Akun",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Isi data di bawah untuk mendaftar",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 32),

              Text(
                "Nama Lengkap",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 6),
              TextFormField(
                controller: nameC,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Nama tidak boleh kosong'
                            : null,
                decoration: InputDecoration(
                  hintText: 'Masukkan nama lengkap',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              Text("Email", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 6),
              TextFormField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email tidak boleh kosong';
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                  ).hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),

              Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 6),
              TextFormField(
                controller: passC,
                obscureText: _obscure,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password tidak boleh kosong';
                  if (value.length < 8) return 'Password minimal 8 karakter';
                  if (!RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W]).+$',
                  ).hasMatch(value))
                    return 'Password harus ada huruf besar, kecil & angka/simbol';
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan password',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final result = await UserApi.registerUser(
                        name: nameC.text.trim(),
                        email: emailC.text.trim(),
                        password: passC.text,
                      );

                      if (result['success']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Pendaftaran berhasil!')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result['message']),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Sudah punya akun? Masuk",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
