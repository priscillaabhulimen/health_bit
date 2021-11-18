import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_bit/core/models/item.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:health_bit/ui/base/base_view_model.dart';

class TrackViewModel extends BaseViewModel{
  bool _isWelcome = false;
  bool get isWelcome=> _isWelcome;

  set isWelcome(bool val) {
    _isWelcome = val;
    notifyListeners();
  }

  CarouselController controller;

  int _current = 0;
  int get current => _current;

  set current(int val){
    _current = val;
    notifyListeners();
  }

  List<TrackItem> items = [
    TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/b_pressure.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/b_pressure.png', color: AppColors.mainTeal,),
        label: 'Blood pressure',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur porttitor felis, '
            'ut fermentum lacus gravida ut. Suspendisse posuere, tellus sit amet auctor aliquam, nunc nisl '
            'imperdiet enim, id sagittis tortor augue eu urna. Morbi vulputate eros vitae odio sollicitudin fermentum. '
            'Sed vel quam bibendum, iaculis nisi quis, malesuada neque. Vestibulum quis dolor neque. '
            'Ut a lacus quis erat tempus luctus vitae eu quam. Fusce ut rhoncus augue, fermentum fringilla urna. '
            'In non maximus libero. Phasellus eget ante a nulla pulvinar facilisis sit amet ac arcu. '
            'Vivamus ut ullamcorper urna. Aliquam et sapien pharetra, feugiat magna a, dictum felis. '
            'Mauris blandit efficitur nibh quis maximus. Vestibulum ante ipsum primis in faucibus orci luctus '
            'et ultrices posuere cubilia curae;'

            'Nunc ac justo faucibus, cursus ante a, bibendum mauris. Duis magna orci, '
            'mollis sed odio id, luctus faucibus justo. Sed maximus ut velit in scelerisque. '

    ),
    TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/b_sugar.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/b_sugar.png', color: AppColors.mainTeal,),
        label: 'Blood Sugar',
        description: 'Nunc ac justo faucibus, cursus ante a, bibendum mauris. Duis magna orci, '
            'mollis sed odio id, luctus faucibus justo. Sed maximus ut velit in scelerisque. '
            'Fusce quis est congue, efficitur justo id, molestie augue. Praesent rhoncus id '
            'magna vestibulum elementum. Ut molestie rutrum enim ut euismod. Cras gravida, sem blandit '
            'egestas iaculis, arcu nisi suscipit nulla, in lacinia sapien sem id felis. In hac habitasse platea dictumst. '
            'Sed euismod suscipit erat eget congue. Sed at vestibulum massa. Donec mattis ut lacus in ultricies.'

    ),
    TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/water_intake.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/water_intake.png', color: AppColors.mainTeal,),
        label: 'Water Intake',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur porttitor felis, '
            'ut fermentum lacus gravida ut. Suspendisse posuere, tellus sit amet auctor aliquam, nunc nisl '
            'imperdiet enim, id sagittis tortor augue eu urna. Morbi vulputate eros vitae odio sollicitudin fermentum. '
            'Sed vel quam bibendum, iaculis nisi quis, malesuada neque.'

    ),
    TrackItem(
        onTap: (){},
        activeImage: Image.asset('assets/images/period.png', color: AppColors.mainWhite,),
        inactiveImage: Image.asset('assets/images/period.png', color: AppColors.mainTeal,),
        label: 'Period',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur porttitor felis, '
            'ut fermentum lacus gravida ut. Suspendisse posuere, tellus sit amet auctor aliquam, nunc nisl '
            'imperdiet enim, id sagittis tortor augue eu urna. Morbi vulputate eros vitae odio sollicitudin fermentum. '
            'Sed vel quam bibendum, iaculis nisi quis, malesuada neque. Vestibulum quis dolor neque. '
            'Ut a lacus quis erat tempus luctus vitae eu quam. Fusce ut rhoncus augue, fermentum fringilla urna. '
            'In non maximus libero. Phasellus eget ante a nulla pulvinar facilisis sit amet ac arcu. '
            'Vivamus ut ullamcorper urna. Aliquam et sapien pharetra, feugiat magna a, dictum felis. '
            'Mauris blandit efficitur nibh quis maximus. Vestibulum ante ipsum primis in faucibus orci luctus '
            'et ultrices posuere cubilia curae;'

    ),
  ];

  void init() async{
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      Future.delayed(Duration(milliseconds: 1500), (){
        isWelcome = true;
      });
    });
  }
}