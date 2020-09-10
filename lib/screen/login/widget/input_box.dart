import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mustang_dashboard/constant/constant.dart';

class InputBox extends StatelessWidget {
  final String label;
  final String secondLabel;
  final String hintText;
  final bool obscureText;

  const InputBox(
      {Key key,
      @required this.label,
      @required this.hintText,
      this.secondLabel = "",
      this.obscureText: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: size.width * 0.04)),
            Text(secondLabel,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: size.width * 0.04,
                    color: Theme.of(context).accentColor)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontSize: size.width * 0.05, letterSpacing: 1),
          obscureText: obscureText,
          decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).accentColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: size.width * 0.04, letterSpacing: 1),
              hintText: hintText,
              fillColor: kBackgroundDarkerColor),
          showCursor: false,
        )
      ],
    );
  }
}
