import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class DashboardDetail extends AnimatedWidget {
  final String imageAddress;
  final String status;
  final String componentName;
  final bool checked;
  final AnimationController controller;

  const DashboardDetail(
      {@required this.controller,
      this.imageAddress,
      this.status,
      this.componentName,
      this.checked = false})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imageAddress,
            color: checked
                ? controller.drive(
                    ColorTween(begin: kWatermarkTextColor, end: kAccentColor)).value
                : controller.drive(
                ColorTween(begin: kWatermarkTextColor, end: Colors.white )).value,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            status,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: size.width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            componentName,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.030),
          )
        ],
      ),
    );
  }
}
