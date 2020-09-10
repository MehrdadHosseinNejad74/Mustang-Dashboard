import 'package:flutter/cupertino.dart';

import 'package:mustang_dashboard/constant/constant.dart';
import 'input_box.dart';

class LoginInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          InputBox(
            hintText: 'Ford ID or Email',
            label: "Username",
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          InputBox(
            hintText: 'Min 8 characters',
            label: 'Password',
            secondLabel: "Forgot?",
          )
        ],
      ),
    );
  }
}
