import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_bit/core/providers/user_provider.dart';
import 'package:health_bit/utils/health_bit_modal_helpers.dart';
import 'package:health_bit/widgets/confirm_back_tap.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  final int index;

  const MainPage({Key key, this.index = 0}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState(index);
}

class _MainPageState extends State<MainPage> {
  int index;
  _MainPageState(this.index) : _currentIndex = index;
  int _currentIndex;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> _children = [
      Container(height: size.height,),
      Container(height: size.height,),
    ];
    return Consumer<UserProvider>(
      builder: (context, userProvider, _){
        return Scaffold(
          body: ConfirmBackTap(
              message: 'Press back again to exit',
              child: _children[_currentIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.white.withOpacity(.9),
                  width: .5,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: InActiveItem(icon: 'heart', title: 'Track', size: size),
                  activeIcon:
                  ActiveItem(icon: 'heart', title: 'Track', size: size),
                  title: SizedBox(),
                ),
                BottomNavigationBarItem(
                  icon: InActiveItem(icon: 'stats', title: 'Stats', size: size),
                  activeIcon:
                  ActiveItem(icon: 'stats', title: 'Stats', size: size),
                  title: SizedBox(),
                ),
              ],
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int index){
                setStateIfMounted(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          // ),
        );
      },
    );
  }
}

class InActiveItem extends StatelessWidget {
  final String icon;
  final String title;
  final Size size;
  final double iconSize;
  final double textFontSize;

  const InActiveItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.size,
    this.iconSize = 23,
    this.textFontSize = 12,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Opacity(
            opacity: .5,
            child: Image.asset(
              'assets/images/menu_icons/${icon}_inactive.png',
              height: iconSize,
            ),
          ),
        ),
        title.isEmpty
            ? SizedBox()
            : Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title ?? ' ',
                style: TextStyle(
                    fontSize: textFontSize,
                    color: Color(0xFF202046).withOpacity(.5),
                    fontWeight: FontWeight.w400),
              )),
        )
      ],
    );
  }
}

class ActiveItem extends StatelessWidget {
  final String icon;
  final String title;
  final Size size;
  final double iconSize;
  final double textFontSize;

  const ActiveItem(
      {Key key,
        @required this.icon,
        @required this.title,
        @required this.size,
        this.iconSize = 23,
        this.textFontSize = 12})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(icon, size: iconSize, color: Color(0xFF6B42DD)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Image.asset(
            'assets/images/menu_icons/${icon}_active.png',
            height: iconSize,
          ),
        ),
        title.isEmpty
            ? SizedBox()
            : Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: textFontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              )),
        )
      ],
    );
  }
}