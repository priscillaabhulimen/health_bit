import 'package:flutter/material.dart';

import '../../app/locator.dart';
import '../../core/services/navigator_service.dart';

class BaseViewModel extends ChangeNotifier {
  final navigationService = locator<NavigationService>();

  //get `BuildContext`
  BuildContext get appContext => navigationService.navigatorKey.currentContext;


  bool _isLoading = false;
  bool disposed = false;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
      _isLoading = val;
      notifyListeners();
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  // @override
  // void notifyListeners() {
  //   if (!disposed) {
  //     super.notifyListeners();
  //   }
  // }
}
