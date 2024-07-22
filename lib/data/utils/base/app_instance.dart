
class AppInstance {
  static final AppInstance _instance = AppInstance._internal();


  factory AppInstance() {
    return _instance;
  }

  AppInstance._internal();

}
