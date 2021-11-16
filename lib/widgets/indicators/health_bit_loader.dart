import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:health_bit/styles/colors.dart';

class HealthBitSpinner extends StatelessWidget {
  final double size;
  final bool isBlue;

  const HealthBitSpinner({
    Key key,
    this.size = 40.0,
    this.isBlue = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: isBlue ? AppColors.mainTeal : Colors.white,
      size: size,
    );
  }
}
