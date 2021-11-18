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
        activeImage: Image.asset('assets/images/b_pressure.png', color: AppColors.lighterTeal,),
        inactiveImage: Image.asset('assets/images/b_pressure.png', color: AppColors.mainTeal,),
        label: 'Blood pressure',
      ),
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/b_sugar.png', color: AppColors.lighterTeal,),
        inactiveImage: Image.asset('assets/images/b_sugar.png', color: AppColors.mainTeal,),
        label: 'Blood Sugar',
      ),
      TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/water_intake.png', color: AppColors.lighterTeal,),
        inactiveImage: Image.asset('assets/images/water_intake.png', color: AppColors.mainTeal,),
        label: 'Water Intake',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mainWhite.withOpacity(.9),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 24),
        height: size.height,
        child: CarouselSlider(
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
            height: 200,
            enlargeCenterPage: true,
            viewportFraction: 0.5,
            aspectRatio: 12/16,
            onPageChanged: (index, reason){
              setState(() {
                _current = index;
              });
            }
          ),
        ),
      ),
    );
  }
}
