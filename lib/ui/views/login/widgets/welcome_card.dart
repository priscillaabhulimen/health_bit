
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/styles/textstyles.dart';

class WelcomeBox extends StatefulWidget {
  const WelcomeBox({Key key}) : super(key: key);

  @override
  _WelcomeBoxState createState() => _WelcomeBoxState();
}

class _WelcomeBoxState extends State<WelcomeBox> with SingleTickerProviderStateMixin{
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
        final x = animation.value * size.width;
        return Transform(
          transform: Matrix4.translationValues(x, 0, 0),
          child: child,
        );
      },
      child: Container(
        width: size.width,
        alignment: Alignment.center,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Health Bit',
                style: AppTextStyles.cardLabel,
              ),
              Text(
                'Take the tour',
                style: AppTextStyles.label,
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: kElevationToShadow[3],
              border: Border.all(color: AppColors.secondaryTeal),
              borderRadius: BorderRadius.circular(5)
          ),
        ),
      ),
    );
  }
}