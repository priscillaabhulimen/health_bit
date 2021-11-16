import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/styles/textstyles.dart';
import 'package:health_bit/ui/base/base_view.dart';
import 'package:health_bit/ui/views/login/view_model.dart';
import 'package:health_bit/ui/views/login/widgets/welcome_card.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, _){
        return Scaffold(
          backgroundColor: AppColors.mainWhite,
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    color: AppColors.lightTeal.withOpacity(0.2)
                ),
              ),
              model.isWelcome ? Positioned(top: 100, child: WelcomeBox()) : SizedBox(),
              model.isLogin ? Positioned(bottom: 0, child: LoginCard()) : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({Key key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // print('Welcome box init state');
    controller = AnimationController(
      duration: Duration(
          seconds: 1
      ),
      vsync: this,
    )..forward();
    animation = Tween<double>(begin: 1,  end: 0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final y = animation.value * size.height;
        return Transform(
          transform: Matrix4.translationValues(0, y, 0),
          child: child,
        );
      },
      child: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: 250,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Health Bit',
                style: AppTextStyles.cta,
              ),
              Text(
                'Take the tour',
                style: AppTextStyles.toolInfo,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: AppColors.mainWhite,
              boxShadow: kElevationToShadow[3],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
          ),
        ),
      ),
    );
  }
}
