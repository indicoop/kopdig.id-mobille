import 'package:flutter/material.dart';
import 'package:kopdig/modules/profile/edit_profile/screen/edit_profile.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class EditPassword extends StatefulWidget{
  const EditPassword ({Key? key}) : super(key: key);
  _EditPassword createState() => _EditPassword();
}

class _EditPassword extends State<EditPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: (){
                  Navigator.pop(context);
                },
              );
            },
          ),
          centerTitle: true,
          title: Text("Masukkan Password", style: KopdigTheme.title),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                                'Untuk mengamankan akunmu \nsilahkan verifikasi identitas dengan \nmemasukkan password ',
                                style: KopdigTheme.text1),
                          ),
                          _buildTextInputHint('Password Saat ini'),
                          _buildTextInputPassword(),
                          _buildTextInputHint('Password Baru'),
                          _buildTextInputNewPassword(),
                          _buildTextInputHint('Konfirmasi Password'),
                          _buildTextInputConfirm(),
                          SizedBox(
                            height: 30.0,
                          ),
                          kopdigButton(
                              context: context,
                              text: 'Simpan',
                              isEnabled: true,
                              onPressed: () {})
                        ]
                    )
                )
            )
        )
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

  Widget _buildTextInputPassword() {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(15, 8, 20, 8),
      child: TextField(
        showCursor: true,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }

  Widget _buildTextInputNewPassword() {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(15, 8, 20, 8),
      child: TextField(
        showCursor: true,
        controller: _newpasswordController,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }


  Widget _buildTextInputConfirm() {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(15, 8, 20, 8),
      child: TextField(
        showCursor: true,
        controller: _confirmpasswordController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }
}