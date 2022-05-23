import 'package:flutter/material.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';
import 'package:kopdig/ui/theme/kopdig_theme.dart';

class EditPassword extends StatefulWidget{
  const EditPassword ({Key? key}) : super(key: key);
  _EditPassword createState() => _EditPassword();
}

class _EditPassword extends State<EditPassword> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          leading: Icon(Icons.arrow_back, color: Colors.black,),
          centerTitle: true,
          title: Text("Ubah Password", style: KopdigTheme.title),
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
                              'Untuk mengamankan akunmu \n silahkan verifikasi identitas dengan \n memasukkan password ',
                            style: KopdigTheme.text1),
                          ),
                          _buildTextInputHint('Password Saat ini'),
                          _buildTextInput(),
                          _buildTextInputHint('Password Baru'),
                          _buildTextInput(),
                          _buildTextInputHint('Konfirmasi Password'),
                          _buildTextInput(),
                          kopdigPrimaryButton(
                              context: context,
                              text: 'Simpan',
                              isEnabled: true,
                              onPressed: (){})
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

  Widget _buildTextInput(){
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
      child: TextField(
        showCursor: true,
        controller: _namaController,
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
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }
}