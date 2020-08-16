import 'package:flutter/cupertino.dart';

import 'dashboard_detail.dart';

class EngineCheck extends StatelessWidget {
  const EngineCheck({
    Key key,
    @required this.fadeAnimation,
    @required this.slideController,
    @required this.engineFadeController,
    @required this.oilFadeController,
    @required this.tempFadeController,
  }) : super(key: key);

  final Animation fadeAnimation;
  final AnimationController slideController;
  final AnimationController engineFadeController;
  final AnimationController oilFadeController;
  final AnimationController tempFadeController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: size.width * 0.3,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideController
                .drive(Tween<Offset>(begin: Offset(-0.1, 0), end: Offset.zero)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DashboardDetail(
                  controller: engineFadeController,
                  checked: false,
                  componentName: 'Engine',
                  imageAddress: 'assets/icon/Engine.svg',
                  status: 'OK',
                ),
                SizedBox(
                  height: 10,
                ),
                DashboardDetail(
                  controller: oilFadeController,
                  checked: true,
                  componentName: 'Oil',
                  imageAddress: 'assets/icon/Oil.svg',
                  status: 'Change',
                ),
                SizedBox(
                  height: 10,
                ),
                DashboardDetail(
                  controller: tempFadeController,
                  checked: false,
                  componentName: 'Avg. temperature',
                  imageAddress: 'assets/icon/Temp.svg',
                  status: 'OK',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
