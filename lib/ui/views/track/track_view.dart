import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/styles/textstyles.dart';
import 'package:health_bit/core/models/item.dart';

class TrackView extends StatefulWidget {
  const TrackView({Key key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  CarouselController controller;

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<TrackItem> items = [
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/b_pressure.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/b_pressure.png', color: AppColors.mainTeal,),
        label: 'Blood pressure',
      ),
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/b_sugar.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/b_sugar.png', color: AppColors.mainTeal,),
        label: 'Blood Sugar',
      ),
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/water_intake.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/water_intake.png', color: AppColors.mainTeal,),
        label: 'Water Intake',
      ),
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/period.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/period.png', color: AppColors.mainTeal,),
        label: 'Period',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainWhite.withOpacity(.9),
        centerTitle: true,
        title: Text(
          'What would you like to record today',
          style: AppTextStyles.appBar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 24),
        height: size.height,
        child: Column(
          children: [
            CarouselSlider(
              items: items.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: e.value.onTap,
                  child: Container(
                      height: size.height/3.5,
                      width: size.width/2,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: e.key == _current ? AppColors.mainTeal : null,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.mainTeal
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                alignment: Alignment.center,
                                child: e.key == _current ? e.value.activeImage : e.value.inactiveImage
                            ),
                          ),
                          Text(
                            e.value.label,
                            style: e.key == _current ? AppTextStyles.cardLabelHighlight : AppTextStyles.cardLabel,
                          )
                        ],
                      ),
                    ),
                );
              }).toList(),
              carouselController: controller,
              options: CarouselOptions(
                initialPage: 0,
                height: 200,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 12/16,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason){
                  setState(() {
                    _current = index;
                  });
                }
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((e){
                return Container(
                    width: 6.0,
                    height: 6.0,
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (AppColors.primaryColor.withOpacity(_current == e.key ? 0.9 : 0.4)),
                    ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
