import 'package:flutter/material.dart';
import 'package:kopdig/modules/profile/edit_profile/screen/ubah_password.dart';
import 'package:kopdig/modules/profile/screen/profile_screen.dart';
import 'package:kopdig/ui/component/button/button_kopdig_primary.dart';
import '../../../../ui/theme/kopdig_theme.dart';

class EditProfile extends StatefulWidget{
  const EditProfile ({Key? key}) : super(key: key);
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  var currentSelectedValue;
  final Gender = ["Perempuan", "Laki-laki"];

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
              onPressed: () => Navigator.pop(context),
            );
          },
        ),
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
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(
                            'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg'),
                        child: Container(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Icon(Icons.add, size: 40,
                                color: KopdigTheme.primaryColorDarker,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 20.0),
                  _buildTextInputNama('Nama'),
                  _buildGenderField(),
                  _buildTextInputPhone('+62'),
                  _buildTextInputEmail('Email'),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditPassword()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ubah Password', style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              Text('Atur Sekarang', style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: poppins),
                              ),
                            ]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  kopdigButton(
                      context: context,
                      text: 'Simpan',
                      isEnabled: true,
                      onPressed: () {})
                ]
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputNama(String text) {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: TextField(
        showCursor: true,
        controller: _namaController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: text,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }

  Widget _buildTextInputPhone(String text) {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: TextField(
        showCursor: true,
        controller: _phoneController,
        keyboardType: TextInputType.phone,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black45,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: text,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }

  Widget _buildTextInputEmail(String text) {
    return Container(
      height: 57.0,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
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
              borderRadius: BorderRadius.circular(15.0),
            ),
            hintText: text,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }

  Widget _buildGenderField() {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint: Text("Jenis Kelamin", style: TextStyle(fontSize: 14, color: Colors.grey),),
                value: currentSelectedValue,
                isDense: true,
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                  print(currentSelectedValue);
                },
                items: Gender.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
