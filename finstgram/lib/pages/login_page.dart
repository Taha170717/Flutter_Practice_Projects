import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _height, _width;
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              _imagewidget(),
              _loginform(),
              _loginButton(),
              _registerpage()
            ],
          )),
        ),
      ),
      // You can add more widgets here to build the login page UI
    );
  }

  Widget _imagewidget() {
    return Image.network(
      'https://sdmntprwestus2.oaiusercontent.com/files/00000000-17e0-61f8-b1cd-0c4db48e54b5/raw?se=2025-07-25T12%3A47%3A08Z&sp=r&sv=2024-08-04&sr=b&scid=c80caea3-29f6-5e93-a42a-a0b2fbb57313&skoid=c953efd6-2ae8-41b4-a6d6-34b1475ac07c&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-07-25T10%3A56%3A52Z&ske=2025-07-26T10%3A56%3A52Z&sks=b&skv=2024-08-04&sig=1jV9GhCBDHvL9Gq4CuOIm4z5jrbTYVVakC7Nr09s78Q%3D',
      height: 150,
      width: 150,
    );
  }

  Widget _loginform() {
    return Container(
      height: _height! * 0.20,
      child: Form(
          key: _loginformKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_emailFeild(),
              _passwordFeild()

            ],
          )),
    );
  }

  Widget _emailFeild() {
    return TextFormField(
        decoration: InputDecoration(
          hintText: "Enter Email",
          labelText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple[200]!, width: 2),
          ),
        ),
        onSaved: (value) {
          setState(() {
            _email = value;
          });
        },
        validator: (_value) {
          bool _result = _value!.contains(RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"));
          return _result ? null :"Please enter Valid Email";

        });

  }

  Widget _passwordFeild() {
    return TextFormField(
      obscureText: true,
        decoration: InputDecoration(
          hintText: "Enter Password",
          labelText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple, width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.purple[200]!, width: 2),
          ),
        ),
        onSaved: (value) {
          setState(() {
            _password = value;
          });
        },
        validator: (_value) =>
        _value!.length>6 ?null : "Please enter a password Greater than 6 characters"

    );
  }


  Widget _loginButton() {
    return MaterialButton(
      onPressed: _loginUser,
      height: _height! * 0.07,
      minWidth: _width! * 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: Colors.purple,
      splashColor: Colors.purpleAccent,
      hoverColor: Colors.purple[700],
      elevation: 8,
      highlightElevation: 12,
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
  Widget _registerpage(){
    return GestureDetector(
      onTap: ()=> {
        Navigator.pushNamed(context, '/register')
      },
      child: Text(
        "Don't have an account? Register",
        style: TextStyle(
          color: Colors.purple,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  void _loginUser(){
    if (_loginformKey.currentState!.validate()){
      _loginformKey.currentState!.save();
      // Here you can add the logic to handle the login with _email and _password
      print("Email: $_email, Password: $_password");
      // Navigate to the next page or perform login action
    } else {
      print("Form is not valid");
    }
  }
}
