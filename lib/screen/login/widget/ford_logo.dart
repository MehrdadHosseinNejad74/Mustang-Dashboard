import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class FordLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/image/FordLogo.svg",
          color: kWatermarkTextColor,
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            '© 2020-Ford',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
