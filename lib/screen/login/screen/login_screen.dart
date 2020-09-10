import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustang_dashboard/constant/constant.dart';
import 'package:mustang_dashboard/screen/login/widget/login_form.dart';
import 'package:mustang_dashboard/screen/login/widget/login_image.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginHeader(),
          LoginForm(),
        ],
      ),
    );
  }
}
