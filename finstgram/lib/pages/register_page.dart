import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey <FormState> _registerFormKey = GlobalKey<FormState>();
  double? _height, _width;
  String? username;
  String? email;
  String? password;
   File? _image;
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _width! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_profileimage(),_registerform(), _registerbutton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageWidget() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 150,
          width: 150,
        ),
      ],
    );
  }

  Widget _registerform(){
    return Container(
      height: _height!* 0.30,
      child: Form(key: _registerFormKey
          ,child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _usernamefield(),
              _emailField(),
              _passwordField(),
            ],

      )),
    );
  }

  Widget _usernamefield() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Enter Username",
        labelText: "Username",
        prefixIcon: Icon(Icons.person, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
        ),
      ),
      validator: (_value) => _value!.isNotEmpty ? null : "Username cannot be empty",
      onSaved: (_value) {
        setState(() {
          username = _value;
        });
      },
    );
  }
  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Enter Email",
        labelText: "Email",
        prefixIcon: Icon(Icons.email, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
        ),
      ),
      onSaved: (value) {
        setState(() {
          email = value;
        });
      },
      validator: (_value) {
        bool result = _value!.contains(RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"));
        return result ? null : "Please enter a valid email";
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Enter Password",
        labelText: "Password",
        prefixIcon: Icon(Icons.lock, color: Colors.purple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
        ),
      ),
      onSaved: (value) {
        setState(() {
          password = value;
        });
      },
      validator: (_value) =>
      _value!.length > 6 ? null : "Password must be 6+ characters",
    );
  }

  Widget _registerbutton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _width! * 0.6,
      height: _height! * 0.06,
      color: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  Widget _profileimage(){
    var _imageProvider = _image != null ? FileImage(_image!) : const NetworkImage("https://i.pravatar.cc/300");
    return GestureDetector(
      onTap: (){
        FilePicker.platform.pickFiles(
          type: FileType.image
        ).then((_result){
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        }
        );
      },
      child: Container(
        height: _height! * 0.15,
        width: _width! * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(image: _imageProvider as ImageProvider, fit: BoxFit.cover) ,
      )
      ),
    );
  }
}
