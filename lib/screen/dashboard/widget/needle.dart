import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mustang_dashboard/constant.dart';

class Needle extends AnimatedWidget {
  final AnimationController gaugeAnimationController;

  Needle({@required this.gaugeAnimationController})
      : super(listenable: gaugeAnimationController);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth * 0.60,
          height: constraint.maxHeight,
          child: Transform.rotate(
            alignment: Alignment.centerRight,
            angle: -pi /
                2.95 *
                gaugeAnimationController
                    .drive(Tween<double>(begin: 1, end: 0.335))
                    .drive(CurveTween(curve: Curves.easeInOutSine))
                    .value,
            child: SvgPicture.asset(
              "assets/icon/Needle.svg",
              color: kAccentColor,
            ),
          ),
        );
      },
    );
  }
}
