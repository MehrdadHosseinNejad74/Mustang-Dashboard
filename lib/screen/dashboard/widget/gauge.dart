import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';
import 'needle.dart';

class Gauge extends StatelessWidget {
  const Gauge({
    Key key,
    @required this.fadeAnimation,
    @required this.slideController,
    @required this.gaugeAnimationController,
  }) : super(key: key);

  final Animation fadeAnimation;
  final AnimationController slideController;
  final AnimationController gaugeAnimationController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: size.width * 0.5,
          height: size.height * 0.40,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideController.drive(
                  Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero)),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                      right: size.width * 0.06,
                      bottom: size.width * 0.14,
                      child: Text(
                        'E',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kAccentColor,
                            fontSize: size.width * 0.065),
                      )),
                  Positioned(
                    right: -size.width * 0.37,
                    child: Container(
                      height: size.height * 0.4,
                      width: size.width * 0.75,
                      child: SvgPicture.asset(
                        "assets/icon/Gauge Bars.svg",
                        color: Color(0xffCCCCCC),
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * 0.13,
                    child: SvgPicture.asset(
                      "assets/icon/Fuel.svg",
                      color: kWatermarkTextColor,
                    ),
                  ),
                  Needle(gaugeAnimationController: gaugeAnimationController),
                  Positioned(
                    right: -size.width * 0.08,
                    child: Container(
                      width: size.width * 0.16,
                      height: size.width * 0.16,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.white12,
                              blurRadius: 5),
                          BoxShadow(
                              offset: Offset(-1, -1),
                              color: Colors.white12,
                              blurRadius: 5)
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.width * 0.17,
                    right: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '270',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: size.width * 0.031,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'km to E',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: size.width * 0.03,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}