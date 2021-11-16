import '../../config_reader.dart';

class Config {
  static bool isProd;
  String baseURL;

  Config() {
    if (isProd) {
      baseURL = ConfigReader.getProdUrl();
    } else {
      baseURL = ConfigReader.getDevUrl();
    }
  }
}