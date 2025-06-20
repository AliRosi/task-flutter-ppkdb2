import 'package:flutter/material.dart';
import 'package:tugas1_flutter/tugas15_flutter/api/user_api.dart';
import 'package:tugas1_flutter/tugas15_flutter/helper/shared_pref.dart';
import 'package:tugas1_flutter/tugas15_flutter/screens/profile_screen.dart';
import 'package:tugas1_flutter/tugas15_flutter/screens/regist_screen.dart';

class LoginScreenn extends StatefulWidget {
  const LoginScreenn({super.key});

  @override
  State<LoginScreenn> createState() => _LoginScreennState();
}

class _LoginScreennState extends State<LoginScreenn> {
  final _formKey = GlobalKey<FormState>();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  bool _obscure = true;
  bool _isLoading = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final result = await UserApi.loginUser(
        email: emailC.text.trim(),
        password: passC.text,
      );
      setState(() => _isLoading = false);

      if (result['success']) {
        final data = result['data'];
        final token = data['token'] ?? '';
        await SharedPrefHelper.saveUser(token: token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'] ?? 'Login gagal')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  "Masuk untuk melanjutkan",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 32),

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
                    ).hasMatch(value))
                      return 'Format email tidak valid';
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
                      return 'Harus ada huruf besar, kecil & angka/simbol';
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
                        setState(() => _obscure = !_obscure);
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
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child:
                        _isLoading
                            ? CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            )
                            : Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),

                SizedBox(height: 16),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Belum punya akun? Daftar",
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
      ),
    );
  }
}
