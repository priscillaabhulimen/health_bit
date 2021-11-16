import 'package:another_flushbar/flushbar.dart';
import 'package:health_bit/app/locator.dart';
import 'package:health_bit/core/api/service_state.dart';
import 'package:health_bit/core/services/navigator_service.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/widgets/health_bit_alert.dart';

import 'error_helper.dart';

class HealthBitAppNotification {
  HealthBitAppNotification._();

  static Future<Flushbar<dynamic>> _show({
    @required String message,
    String title,
    Color backgroundColor,
    IconData icon,
  }) async {
    return Flushbar(
      shouldIconPulse: true,
      borderRadius: BorderRadius.circular(12),
      titleText: Text(
        title ?? '',
        style: TextStyle(
            fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message ?? '',
        style: TextStyle(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: backgroundColor ?? Colors.red,
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      icon: Icon(
        icon ?? Icons.info,
        size: 25.0,
        color: Colors.white,
      ),
      duration: Duration(milliseconds: 2000),
      animationDuration: Duration(milliseconds: 500),
    );
  }

  static Future<dynamic> success({
    BuildContext context,
    @required message,
  }) async {
    NavigationService navigationService = locator<NavigationService>();
    final _appContext = navigationService.navigatorKey.currentContext;

    return HealthBitAlert.show(
      context ?? _appContext,
      title: 'Success',
      description: message ?? '',
      gravity: HealthBitAlert.TOP,
      backgroundColor: AppColors.primaryColor,
      duration: 1,
      icon: Icons.check
    );
  }

  static Future<dynamic> error({
    BuildContext context,
    dynamic message,
  }) async {
    String errorMessage;

    if (message is ErrorState) {
      final error = message.value;
      errorMessage = error.errorMessage;
    } else if (message is String) {
      errorMessage = message;
    } else {
      errorMessage = genericErrorMessageString;
    }

    Flushbar flush = await _show(
      message: errorMessage ?? genericErrorMessageString,
      backgroundColor: Colors.red,
      icon: Icons.cancel,
      title: 'Error',
    );

    NavigationService navigationService = locator<NavigationService>();
    final _appContext = navigationService.navigatorKey.currentContext;

    return HealthBitAlert.show(
      context ?? _appContext,
      title: 'Oops',
      description: errorMessage ?? genericErrorMessageString,
      gravity: HealthBitAlert.TOP,
      backgroundColor: Colors.red,
      duration: 1,
      icon: Icons.clear
    );

  }

  static Future<dynamic> info({
    BuildContext context,
    @required message,
    String title = 'Alert',
  }) async {
    Flushbar flush = await _show(
      message: message ?? 'alert',
      backgroundColor: AppColors.primaryColor,
      icon: Icons.info_outline,
      title: title,
    );

    NavigationService navigationService = locator<NavigationService>();
    final _appContext = navigationService.navigatorKey.currentContext;

    return HealthBitAlert.show(
      context ?? _appContext,
      title: title ?? 'Alert',
      description: message,
      gravity: HealthBitAlert.TOP,
      backgroundColor: AppColors.primaryColor,
      duration: 1,
      icon: Icons.info_outline
    );

  }
}
