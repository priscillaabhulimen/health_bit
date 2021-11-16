import 'package:flutter/material.dart';
import 'package:health_bit/router.dart';
import 'package:health_bit/styles/colors.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'app/locator.dart';
import 'core/providers/setup.dart';
import 'core/services/navigator_service.dart';

class HealthBitApp extends StatelessWidget {
  final bool isDebug;

  const HealthBitApp({
    Key key,
    this.isDebug = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: OKToast(
        child: MaterialApp(
          debugShowCheckedModeBanner: isDebug,
          title: 'Health Bit',
          navigatorKey: locator<NavigationService>().navigatorKey,
          theme: ThemeData(
            fontFamily: 'PlusJakartaDisplay',
            scaffoldBackgroundColor: AppColors.mainWhite,
          ),
          onGenerateRoute: HealthBitRouter.generateRoute,
          initialRoute: '/',
        ),
      ),
    );
  }
}