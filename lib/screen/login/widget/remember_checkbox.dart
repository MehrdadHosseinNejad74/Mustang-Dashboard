import 'package:flutter/material.dart';
import 'package:mustang_dashboard/constant/constant.dart';

class RememberCheckBox extends StatefulWidget {
  @override
  _RememberCheckBoxState createState() => _RememberCheckBoxState();
}

class _RememberCheckBoxState extends State<RememberCheckBox> {
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: size.width * 0.07,
            height: size.width * 0.07,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.white12,
                    offset: Offset(-2, -2),
                    blurRadius: 2),
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 1)
              ],
              shape: BoxShape.rectangle,
              border: Border.all(width: 1, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.transparent),
              child: Checkbox(
                onChanged: (check) {
                  setState(() {
                    checked = !checked;
                  });
                },
                value: checked,
                activeColor: Theme.of(context).backgroundColor,
                autofocus: false,
                checkColor: Theme.of(context).accentColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Remember me',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: size.width * 0.04),
          )
        ],
      ),
    );
  }
}
