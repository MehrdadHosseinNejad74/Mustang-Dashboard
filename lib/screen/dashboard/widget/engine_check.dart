import 'package:flutter/cupertino.dart';
import 'package:mustang_dashboard/enums/EngineComponents.dart';
import 'package:mustang_dashboard/model/car_model.dart';
import 'package:mustang_dashboard/model/engine_model.dart';

import 'dashboard_detail.dart';

class EngineCheck extends StatelessWidget {
  const EngineCheck({
    Key key,
    @required this.fadeAnimation,
    @required this.slideController,
    @required this.engineFadeController,
    @required this.oilFadeController,
    @required this.tempFadeController,
    this.car,
  }) : super(key: key);

  final Animation fadeAnimation;
  final AnimationController slideController;
  final AnimationController engineFadeController;
  final AnimationController oilFadeController;
  final AnimationController tempFadeController;
  final Car car;

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
                  checked: car.engineModel[EngineComponent.ENGINE].status ==
                          Status.OK
                      ? false
                      : true,
                  name: car.engineModel[EngineComponent.ENGINE].name,
                  imageUrl: car.engineModel[EngineComponent.ENGINE].imageUrl,
                  status: car.engineModel[EngineComponent.ENGINE].status.name,
                ),
                SizedBox(
                  height: 10,
                ),
                DashboardDetail(
                  controller: oilFadeController,
                  checked:
                      car.engineModel[EngineComponent.OIL].status == Status.OK
                          ? false
                          : true,
                  name: car.engineModel[EngineComponent.OIL].name,
                  imageUrl: car.engineModel[EngineComponent.OIL].imageUrl,
                  status: car.engineModel[EngineComponent.OIL].status.name,
                ),
                SizedBox(
                  height: 10,
                ),
                DashboardDetail(
                  controller: tempFadeController,
                  checked:
                      car.engineModel[EngineComponent.TEMP].status == Status.OK
                          ? false
                          : true,
                  name: car.engineModel[EngineComponent.TEMP].name,
                  imageUrl: car.engineModel[EngineComponent.TEMP].imageUrl,
                  status: car.engineModel[EngineComponent.TEMP].status.name,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
