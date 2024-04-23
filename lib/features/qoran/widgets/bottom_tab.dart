// ignore: must_be_immutable
import 'package:flutter/material.dart';
import '../../../utils/style.dart';
import '../../alahadith/screens/coming_soon_screen.dart';
import '../../alahadith/screens/hadith_home_screen.dart';
import '../screens/home_screen.dart';

// ignore: must_be_immutable
class BottomTabBarr extends StatefulWidget {
  static const routeName = 'bottomtab';

  Widget? widgetoutside;

  BottomTabBarr({this.widgetoutside});

  @override
  _BottomTabBarrState createState() => _BottomTabBarrState();
}

class _BottomTabBarrState extends State<BottomTabBarr> {
  @override
  void initState() {
    super.initState();
    if (widget.widgetoutside != null) {
      _selectedIndex = 1;
      _widgetOptions = [
        HomeScreen(),
        ComingSoonScreen(),
      ];
      // _widgetOptionsunauth = _widgetOptions;
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    print(_selectedIndex);
    print(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  static List _widgetOptions = [
    HomeScreen(),
    ComingSoonScreen(),
  ];
  // static List _widgetOptionsunauth = [
  //   HomeScreen(),
  //   HadithHomeScreen(),
  // ];

  var provider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: _widgetOptions.elementAt(_selectedIndex),
        body: _widgetOptions.elementAt(_selectedIndex),
        // backgroundColor: _selectedIndex == 0
        //     ? Colors.black
        //     : Colors.white, //&& widget.widgetoutside == null
        backgroundColor: Style.background1,
        extendBody: true,
        bottomNavigationBar: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Style.whiteColor,
                // : Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                // blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            // color: _selectedIndex == 0 //&& widget.widgetoutside == null
            //     ? Colors.black
            //     : Colors.white,
          ),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                costumcollum("assets/images/taw7id.png", 0),
                costumcollum("assets/images/qoran.png", 1),
              ]),
        ),
      ),
    );
  }

  costumcollum(ico, numb) {
    return InkWell(
      onTap: () => _onItemTapped(numb),
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: numb == _selectedIndex ? Style.greyClr : Style.whiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(ico, height: 57
            // color: _selectedIndex == 0
            //     ? Colors.white
            //     : numb == _selectedIndex
            //         ? Style.primarycolo
            //         : Style.greycolor,
            ),
      ),
    );
  }
}
