
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/router.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/styles/textstyles.dart';
import 'package:health_bit/ui/views/splash_screen/splash_screen.dart';
import 'package:health_bit/utils/health_bit_page_route.dart';
import 'package:health_bit/values/images.dart';

class WelcomeBox extends StatefulWidget {
  const WelcomeBox({Key key}) : super(key: key);

  @override
  _WelcomeBoxState createState() => _WelcomeBoxState();
}

class _WelcomeBoxState extends State<WelcomeBox> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;
  AnimationController cont;
  Animation<double> anim;
  AnimationController animController;
  Animation<double> animatn;

  Image imageLogo;
  Image imageGuide;
  Image background;

  @override
  void initState() {
    super.initState();
    imageGuide = Image.asset('assets/images/tour_guide.png');
    imageLogo = Image.asset(AppImages.healthBitLogo);
    background = Image.asset('assets/images/background.jpg');

    controller = AnimationController(
      duration: Duration(
          seconds: 1
      ),
      vsync: this,
    )..forward();
    animation = Tween<double>(begin: 1,  end: 0).animate(controller);
    cont = AnimationController(
      duration: Duration(
          seconds: 1
      ),
      vsync: this,
    );
    anim = Tween<double>(begin: -1,  end: 0).animate(cont);
    Future.delayed(Duration(milliseconds: 800), (){
      cont.forward();
    });
    animController = AnimationController(
      duration: Duration(
          seconds: 1
      ),
      vsync: this,
    );
    animatn = Tween<double>(begin: 1,  end: 0).animate(animController);
    Future.delayed(Duration(milliseconds: 800), (){
      animController.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(imageLogo.image, context);
    precacheImage(imageGuide.image, context);
    precacheImage(background.image, context);
  }

  @override
  void dispose() {
    controller.dispose();
    cont.dispose();
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: background.image,
          fit: BoxFit.cover,
        )
      ),
      child: Stack(
        children: [
          Container(
            color: AppColors.mainBlack.withOpacity(0.8),
          ),
          Column(
            children: [
              Spacer(),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageLogo.image,
                    fit: BoxFit.fill
                  )
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      final x = animation.value * size.width;
                      return Transform(
                        transform: Matrix4.translationValues(x, 0, 0),
                        child: child,
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        width: size.width *0.85,
                        decoration: BoxDecoration(
                            color: AppColors.lighterTeal,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)
                          ),
                          boxShadow: kElevationToShadow[3]
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Welcome to',
                              style: AppTextStyles.cta,
                            ),
                            Text(
                              'Health Bit',
                              style: AppTextStyles.banner,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  AnimatedBuilder(
                    animation: anim,
                    builder: (context, child) {
                      final x = anim.value * size.width;
                      return Transform(
                        transform: Matrix4.translationValues(x, 0, 0),
                        child: child,
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        width: size.width *0.85,
                        decoration: BoxDecoration(
                          color: AppColors.lightTeal,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: kElevationToShadow[3]
                        ),
                        child:Column(
                          children: [
                            imageGuide,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Take the tour',
                                    style: AppTextStyles.cardLabel,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.mainWhite,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              AnimatedBuilder(
                animation: animatn,
                builder: (context, child) {
                  final y = animatn.value * size.width;
                  return Transform(
                    transform: Matrix4.translationValues(0, y, 0),
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: (){
                    animController.reverse();
                    cont.reverse();
                    controller.reverse();
                    Future.delayed(Duration(milliseconds: 800), (){
                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    height: 50,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: Text(
                      'Continue',
                      style: AppTextStyles.label,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}