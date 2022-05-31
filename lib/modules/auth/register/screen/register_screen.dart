import 'package:flutter/material.dart';
import 'package:kopdig/modules/auth/bloc/auth_bloc.dart';
import 'package:kopdig/modules/auth/bloc/auth_event.dart';
import 'package:kopdig/modules/auth/helper/auth_delegate.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';
import 'package:kopdig/ui/component/dialog/dialog_component.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements AuthDelegate {
  late AuthBloc _bloc;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _creditCardController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _passwordVisible = true;
  bool _passwordConfirmVisible = true;
  String _selectedGender = "L";
  int _radioIndex = 1;

  @override
  void initState() {
    super.initState();
    _bloc = AuthBloc();
    _passwordVisible = false;
    _passwordConfirmVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _registerUser();
                    }
                  },
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextInputHint("Nama Lengkap"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan nama lengkapmu"
                  : null,
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
          const SizedBox(
            height: 12,
          ),
          _buildTextInputHint("Jenis Kelamin"),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: _radioIndex,
                  onChanged: (value) {
                    setState(() {
                      _radioIndex = 1;
                      _selectedGender = "L";
                    });
                  }),
              const Text(
                "Laki-Laki",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: _radioIndex,
                  onChanged: (value) {
                    setState(() {
                      _radioIndex = 2;
                      _selectedGender = "P";
                    });
                  }),
              const Text(
                "Perempuan",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          _buildTextInputHint("Email"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) =>
                  value == null || value.isEmpty ? "Masukkan email mu" : null,
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
            child: TextFormField(
              obscureText: !_passwordVisible,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan Password mu"
                  : value.length < 6
                      ? "Password tidak boleh kurang dari 6 karakter"
                      : null,
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
            child: TextFormField(
              obscureText: !_passwordConfirmVisible,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan konfirmasi password mu"
                  : value != _passwordController.value.text
                      ? "Passwordmu tidak sama"
                      : null,
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
                    _passwordConfirmVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
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
          _buildTextInputHint("Nomor Kartu Kredit"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan Kartu Kredit"
                  : null,
              controller: _creditCardController,
              keyboardType: TextInputType.number,
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
          _buildTextInputHint("No Telfon"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              validator: (value) =>
                  value == null || value.isEmpty ? "Masukkan No Telfon" : null,
              controller: _phoneNumberController,
              keyboardType: TextInputType.number,
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
          _buildTextInputHint("Alamat Lengkap"),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: TextFormField(
              showCursor: true,
              maxLines: 5,
              validator: (value) => value == null || value.isEmpty
                  ? "Masukkan Alamat Lengkap"
                  : null,
              controller: _addressController,
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
        ],
      ),
    );
  }

  Widget _buildTextInputHint(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 15, 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  void _registerUser() {
    var body = {
      "name": _fullNameController.value.text,
      "email": _emailController.value.text,
      "password": _passwordController.value.text,
      "role_id": "1",
      "credit_card_number": _creditCardController.value.text,
      "phone_number": _phoneNumberController.value.text,
      "gender": _selectedGender,
      "address": _addressController.value.text,
      "cooperative_id": "2"
    };

    _bloc.add(RegisterUser(body, this));
  }

  @override
  void onError(String message) {
    showFailedDialog(context: context, title: "Gagal Daftar", message: message);
  }

  @override
  void onSuccess() {
    String message =
        "Kamu sudah berhasil mendaftarkan akun mu, sekarang kamu bisa login di aplikas koperasi digital";
    showSuccessDialog(
        context: context,
        title: "Berhasil Daftar!",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }

  @override
  void onLoading() {
    showLoadingDialog(context: context);
  }
}
