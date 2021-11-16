import 'package:flutter/cupertino.dart';
import 'package:health_bit/ui/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel{
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isWelcome = false;
  bool get isWelcome=> _isWelcome;

  set isWelcome(bool val) {
    _isWelcome = val;
    notifyListeners();
  }

  // bool _isLoading = true;
  // bool get isChecking => _isLoading;
  //
  // set isLoading(bool val) {
  //   _isLoading = val;
  //   notifyListeners();
  // }

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  set isLogin(bool val) {
    _isLogin = val;
    notifyListeners();
  }

  void init() async{
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Future.delayed(Duration(milliseconds: 1500), (){
        isWelcome = true;
        Future.delayed(Duration(milliseconds: 800), (){
          isLogin = true;
        });
      });
    });
  }
}