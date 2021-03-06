import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HealthBitPageRoute {
  HealthBitPageRoute._();

  static MaterialPageRoute<T> routeTo<T>({
    Widget Function(BuildContext) builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) {
    // return MaterialPageRoute<T>(
    return MaterialWithModalsPageRoute<T>(
      builder: builder,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      settings: settings,
    );
  }

  static PageRouteBuilder<T> bounceAnimateTo<T>(Widget nextScreen) {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.bounceOut);
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secAnimation) {
        return nextScreen;
      });
  }
  static PageRouteBuilder<T> slideAnimateTo<T>(Widget nextScreen) {
    return PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation, Widget child) {
          animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secAnimation) {
          return nextScreen;
        });
  }

}
