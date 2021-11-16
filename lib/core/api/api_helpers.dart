import 'package:flutter/material.dart';
import 'package:health_bit/utils/health_bit_app_notification.dart';

import 'service_state.dart';

class APIHelpers {
  APIHelpers._();

  static dynamic handleResponse(
      ServiceState response, {
        @required Function(SuccessState) onSuccess,
        Function(ErrorState) onError,
      }) {
    if (response is SuccessState) {
      onSuccess(response);
    } else if (response is ErrorState && onError != null) {
      onError(response);
    } else if (response is ErrorState) {
      HealthBitAppNotification.error(message: response);
    } else {
      HealthBitAppNotification.error();
    }
  }
}