import 'package:flutter/material.dart';
import 'package:health_bit/utils/health_bit_page_route.dart';

import 'ui/views/main_page.dart';
import 'ui/views/splash_screen/splash_screen.dart';


class HealthBitRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HealthBitPageRoute.routeTo(builder: (_) => SplashPage());
      case '/main':
        return HealthBitPageRoute.routeTo(builder: (_) => MainPage());
      default:
        return HealthBitPageRoute.routeTo(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          ),
        );
    }
  }
}
