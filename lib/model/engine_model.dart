import 'package:flutter/animation.dart';

class EngineStatusModel {

  final String name;
  final Status status;
  final imageUrl;

  EngineStatusModel({this.name, this.status, this.imageUrl});

}


enum Status{

  OK,
  CHANGE,

}

extension Statusxtension on Status {

  String get name {
    switch (this) {
      case Status.OK:
        return 'ok';
      case Status.CHANGE:
        return 'change';
      default:
        return null;
    }
  }


}