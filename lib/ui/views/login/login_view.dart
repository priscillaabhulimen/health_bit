import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/ui/base/base_view.dart';
import 'package:health_bit/ui/views/login/view_model.dart';
import 'package:health_bit/ui/views/login/widgets/welcome_card.dart';
import 'package:health_bit/values/images.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _){
        return Scaffold(
          backgroundColor: AppColors.mainWhite,
          body: Stack(
            children: [
              model.isWelcome ? WelcomeBox() : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
