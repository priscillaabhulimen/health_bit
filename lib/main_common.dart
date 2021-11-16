import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:health_bit/healthbit_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/locator.dart';
import 'core/api/config.dart';
import 'environment.dart';

SharedPreferences prefs;

Future<void> mainCommon(String environ) async {
  WidgetsFlutterBinding.ensureInitialized();

  // await ConfigReader.initialize();

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // cameras = await availableCameras();

    prefs = await SharedPreferences.getInstance();
    // await DotEnv.load();


    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await setUpLocator();


    if (environ == Environment.dev) {
      Config.isProd = false;
    } else {
      Config.isProd = true;
    }

    runApp(HealthBitApp(
      isDebug: environ == Environment.dev,
    ));
  }, (exception, stackTrace) async {
    // await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
