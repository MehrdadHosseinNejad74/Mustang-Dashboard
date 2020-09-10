import 'package:flutter/cupertino.dart';
import 'package:mustang_dashboard/screen/login/widget/register_text.dart';
import 'package:mustang_dashboard/screen/login/widget/remember_checkbox.dart';
import 'package:mustang_dashboard/screen/login/widget/start_button.dart';

import 'ford_logo.dart';
import 'login_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
