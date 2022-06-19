enum Flavor {
  DEMO,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEMO:
        return 'ExamConnect';
      case Flavor.PROD:
        return 'ExamConnect';
      default:
        return 'ExamConnect';
    }
  }

}
