import 'package:flutter/material.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';

import '../../../../ui/theme/kopdig_theme.dart';

class EditProfile extends StatefulWidget{
  const EditProfile ({Key? key}) : super(key: key);
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile>{
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
        title: Text("Edit Profile", style: KopdigTheme.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60.0,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Icon(Icons.add),
                  ),
                  _buildTextInput(),
                  _buildTextInput(),
                  _buildTextInput(),
                  _buildTextInput(),
                  _buildTextInput(),
                  _buildTextInput(),
                  _buildTextInput(),
                  kopdigPrimaryButton(
                      context: context,
                      text: 'Simpan',
                      isEnabled: true,
                      onPressed: (){})
                ]
            ),
          ),
        ),
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