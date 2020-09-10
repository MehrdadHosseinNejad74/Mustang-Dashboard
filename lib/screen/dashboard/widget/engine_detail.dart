import 'package:flutter/cupertino.dart';
import 'package:mustang_dashboard/model/car_model.dart';
import 'package:mustang_dashboard/screen/dashboard/widget/gauge.dart';

import 'engine_check.dart';

class EngineDetail extends AnimatedWidget {
  final AnimationController slideController;
  final AnimationController gaugeAnimationController;
  final Animation fadeAnimation;
  final AnimationController engineFadeController;
  final AnimationController oilFadeController;
  final AnimationController tempFadeController;
  final Car car;

  EngineDetail(
      {this.car,
      this.slideController,
      this.gaugeAnimationController,
      this.fadeAnimation,
      this.engineFadeController,
      this.oilFadeController,
      this.tempFadeController})
      : super(listenable: slideController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EngineCheck(
            car: car,
            fadeAnimation: fadeAnimation,
            slideController: slideController,
            engineFadeController: engineFadeController,
            oilFadeController: oilFadeController,
            tempFadeController: tempFadeController),
        Gauge(
            fadeAnimation: fadeAnimation,
            slideController: slideController,
            gaugeAnimationController: gaugeAnimationController)
      ],
    );
  }
}
