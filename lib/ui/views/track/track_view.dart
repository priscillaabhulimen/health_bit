import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/styles/textstyles.dart';
import 'package:health_bit/ui/base/base_view.dart';
import 'package:health_bit/ui/views/track/view_model.dart';
import 'package:health_bit/widgets/health_bit_alert.dart';

class TrackView extends StatefulWidget {
  const TrackView({Key key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> with TickerProviderStateMixin{
  Image background;
  Image doctor;
  Image message;

  AnimationController controller;
  Animation<double> animation;
  AnimationController cont;
  Animation<double> anim;

  @override
  void initState() {
    super.initState();
    background = Image.asset('assets/images/wallpaper.jpg');
    doctor = Image.asset('assets/images/doctor.png');
    message = Image.asset('assets/images/message.png');

    controller = AnimationController(
      duration: Duration(
          milliseconds: 500
      ),
      vsync: this,
    )..forward();
    animation = Tween<double>(begin: 1,  end: 0).animate(controller);
    cont = AnimationController(
      duration: Duration(
        milliseconds: 500
      ),
      vsync: this,
    )..forward();
    anim = Tween<double>(begin: -1,  end: 0).animate(cont);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(background.image, context);
    precacheImage(doctor.image, context);
    precacheImage(message.image, context);
  }

  @override
  void dispose() {
    controller.dispose();
    cont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.mainTeal,
      body: BaseView<TrackViewModel>(
        model: TrackViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, _){
          return Container(
            padding: EdgeInsets.only(top: 24),
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: background.image,
                fit: BoxFit.cover
              )
            ),
            child: Stack(
              children: [
                Container(
                  color: AppColors.mainTeal.withOpacity(0.3),
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Health Bit',
                        style: AppTextStyles.bannerHighlight,
                      ),
                    ),
                    Container(
                      height: size.height * 0.22,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppColors.mainTeal,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: AnimatedBuilder(
                              animation: anim,
                              builder: (context, child) {
                                final x = anim.value * size.width;
                                return Transform(
                                  transform: Matrix4.translationValues(x, 0, 0),
                                  child: child,
                                );
                              },
                              child: Text(
                                'Lorem ipsum dolor sit amet, lorem ipsum dolor sit amet. '
                                    'Lorem ipsum dolor sit amet. Lorem ipsum.',
                                style: AppTextStyles.input,
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              final x = animation.value * size.width;
                              return Transform(
                                transform: Matrix4.translationValues(x, 0, 0),
                                child: child,
                              );
                            },
                            child: Container(
                              height: 120,
                              width: size.width/2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: doctor.image,
                                  fit: BoxFit.scaleDown
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height/1.8,
                    width: size.width - 20,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.mainWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'What would you like to record?',
                          style: AppTextStyles.appBar,
                        ),
                        SizedBox(height: 20,),
                        CarouselSlider(
                          items: model.items.asMap().entries.map((e) {
                            return GestureDetector(
                              onTap: e.value.onTap,
                              child: Container(
                                height: size.height/3.5,
                                width: size.width/2,
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                decoration: BoxDecoration(
                                    color: e.key == model.current ? AppColors.mainTeal : null,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.mainTeal
                                    )
                                ),
                                  alignment: Alignment.center,
                                  child: e.key == model.current ? e.value.activeImage : e.value.inactiveImage
                              ),
                            );
                          }).toList(),
                          carouselController: model.controller,
                          options: CarouselOptions(
                              initialPage: 0,
                              height: 200,
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              aspectRatio: 12/16,
                              enableInfiniteScroll: false,
                              onPageChanged: (index, reason){
                                  model.current = index;
                              }
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: model.items.asMap().entries.map((e){
                            return Container(
                                width: 6.0,
                                height: 6.0,
                                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (AppColors.primaryColor.withOpacity(model.current == e.key ? 0.9 : 0.4)),
                                ));
                          }).toList(),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          model.items[model.current].label,
                          style: AppTextStyles.labelDark,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
