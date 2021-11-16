import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ConfigReader {
  static String getDevUrl() {
    return env['API_BASE_URL_DEV'] as String;
  }

  static String getProdUrl(){
    return env['API_BASE_URL_PROD'] as String;
  }
}