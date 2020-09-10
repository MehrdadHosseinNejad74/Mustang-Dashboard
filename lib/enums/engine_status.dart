enum Status {
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
