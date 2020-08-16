import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustang_dashboard/constant.dart';
import 'package:mustang_dashboard/screen/login/widget/ford_logo.dart';
import 'package:mustang_dashboard/screen/login/widget/login_image.dart';
import 'package:mustang_dashboard/screen/login/widget/login_input.dart';
import 'package:mustang_dashboard/screen/login/widget/register_text.dart';
import 'package:mustang_dashboard/screen/login/widget/remember_checkbox.dart';
import 'package:mustang_dashboard/screen/login/widget/start_button.dart';

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
          LoginImage(),
          Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    LoginInput(),
                    RememberCheckBox(),
                    SizedBox(
                      height: 15,
                    ),
                    StartButton(),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterText(),
                    FordLogo(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
