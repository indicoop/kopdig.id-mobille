import 'package:flutter/material.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordVisible = true;
  bool _passwordConfirmVisible = true;


  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _passwordConfirmVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                  child: Image.asset(
                    'assets/kopdig.png',
                    height: 120,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      color: KopdigTheme.primaryColorDarker,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 8, 24, 5),
                  child: Text(
                    "Memberikan layanan untuk anda yang tidak memiliki akun",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 22,),
                _buildRegisterSection(),
                const SizedBox(height: 22,),
                kopdigPrimaryButton(
                  context: context,
                  text: 'Daftar',
                  isEnabled: true,
                  onPressed: () async {},
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login disini",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: KopdigTheme.primaryColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextInputHint("Nama Lengkap"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            showCursor: true,
            controller: _fullNameController,
            keyboardType: TextInputType.text,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
          ),
        ),
        _buildTextInputHint("Email"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            showCursor: true,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
          ),
        ),
        _buildTextInputHint("Kata Sandi"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            obscureText: !_passwordVisible,
            cursorColor: Colors.black45,
            keyboardType: TextInputType.text,
            controller: _passwordController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        _buildTextInputHint("Konfirmasi Kata Sandi"),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: TextField(
            obscureText: !_passwordConfirmVisible,
            cursorColor: Colors.black45,
            keyboardType: TextInputType.text,
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordConfirmVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black45,
                ),
                onPressed: () {
                  setState(() {
                    _passwordConfirmVisible = !_passwordConfirmVisible;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextInputHint(String text){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 15, 4),
      child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
    );
  }

}
