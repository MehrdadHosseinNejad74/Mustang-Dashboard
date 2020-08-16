import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant.dart';
class RegisterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: kDefaultPadding),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: size.width*0.04),
            ),
            TextSpan(
              text: "Register",
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: size.width * 0.04,
                  color: Theme.of(context).accentColor),
            )
          ]),
        ),
      ),
    );
  }
}
