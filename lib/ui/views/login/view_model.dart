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

  void init() async{
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Future.delayed(Duration(milliseconds: 1500), (){
        isWelcome = true;
      });
    });
  }
}