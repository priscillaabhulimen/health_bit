import 'package:health_bit/ui/views/login/login_view.dart';
import 'package:health_bit/utils/health_bit_page_route.dart';
import 'package:flutter/material.dart';

import '../../base/base_view_model.dart';
import '../main_page.dart';

class AppStartupViewModel extends BaseViewModel {
  // final _authService = locator<AuthService>();
  bool _isChecking = true;
  bool get isChecking => _isChecking;

  set isChecking(bool val) {
    _isChecking = val;
    notifyListeners();
  }

  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _appContext = navigationService.navigatorKey.currentContext;

      await Future.delayed(Duration(seconds:2));

      Navigator.push(
        _appContext,
        HealthBitPageRoute.bounceAnimateTo(LoginView())
      );

    });
  }
}
