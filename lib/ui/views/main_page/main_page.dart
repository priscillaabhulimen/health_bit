import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_bit/widgets/confirm_back_tap.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConfirmBackTap(
        message: 'Press back again to exit',
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
