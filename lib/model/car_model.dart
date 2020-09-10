import 'package:mustang_dashboard/enums/EngineComponents.dart';

import 'engine_model.dart';

class Car {
  final double mileage;
  final String model;
  final Map<EngineComponent, EngineStatusModel> engineModel;
  final double fuel;
  final String imageUrl;

  Car({this.imageUrl, this.mileage, this.model, this.engineModel, this.fuel});
}

Car mustang = Car(
    mileage: 3407.5,
    imageUrl: "assets/image/MustangCar.png",
    model: "MUSTANG 5.0",
    fuel: 50,
    engineModel: {
      EngineComponent.ENGINE: EngineStatusModel(
          name: 'Engine',
          imageUrl: 'assets/icon/Engine.svg',
          status: Status.OK),
      EngineComponent.OIL: EngineStatusModel(
          name: 'Oil', imageUrl: 'assets/icon/Oil.svg', status: Status.CHANGE),
      EngineComponent.TEMP: EngineStatusModel(
          name: 'Avg. temperature',
          imageUrl: 'assets/icon/Temp.svg',
          status: Status.OK)
    });
