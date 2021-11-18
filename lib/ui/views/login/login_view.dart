import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/ui/base/base_view.dart';
import 'package:health_bit/ui/views/login/view_model.dart';
import 'package:health_bit/ui/views/login/widgets/welcome_card.dart';
import 'package:health_bit/values/images.dart';
import 'package:health_bit/widgets/confirm_back_tap.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Image background;

  @override
  void initState() {
    super.initState();
    background = Image.asset('assets/images/background.jpg');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(background.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _){
        return Scaffold(
          backgroundColor: AppColors.mainWhite,
          body: ConfirmBackTap(
            message: 'Press back again to exit',
            child: Stack(
              children: [
                model.isWelcome ? WelcomeBox(background: background.image,) : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
