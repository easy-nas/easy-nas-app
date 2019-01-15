import 'package:flutter/material.dart';
import 'package:easy_nas_app/routes/login_page.dart';

// 注册
class RegisterPage extends StatefulWidget {
  static String tag = "Register-page";

  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _userName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
          hintText: 'username',
          contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );

    final _password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password',
          contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );

    final _again_password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'password again',
          contentPadding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black))),
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.grey,
        child: Text('Register', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 20.0),
          children: <Widget>[
            new Text(
              "注册",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 48.0),
            _userName,
            SizedBox(height: 28.0),
            _password,
            SizedBox(height: 28.0),
            _again_password,
            SizedBox(height: 24.0),
            registerButton,
          ],
        ),
      ),
    );
  }
}
