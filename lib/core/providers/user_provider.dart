import 'package:flutter/material.dart';
import 'package:health_bit/core/models/user.dart';

class UserProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool val) {
    _isLoggedIn = val;
    notifyListeners();
  }

  UserModel _user;
  UserModel get user => _user;
  set user(UserModel val) {
    _user = val;
    notifyListeners();
  }

  void saveUser(UserModel val) {
    _user = val;
    notifyListeners();
  }
}
