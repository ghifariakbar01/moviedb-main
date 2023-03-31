import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/provider/favorit_prov.dart';
import 'package:omdb/view/pages/favorit.dart';
import 'package:omdb/view/pages/tv.dart';
import 'package:omdb/view/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../pages/home.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  bool keyboardOpen = false;
  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    TVPage(),
    FavoritPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final iconList = <IconData>[Icons.movie, Icons.tv, Icons.favorite];

  Future<bool> onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text(
              'Keluar Aplikasi?',
              style: const TextStyle(
                  color: ColorPalette.btnNewColor, fontWeight: FontWeight.bold),
            ),
            content: const Text('Anda akan keluar dari Aplikasi'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              FlatButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Iya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onWillPop();
      },
      child: Scaffold(
        extendBody: true,
        drawerScrimColor: Colors.transparent,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 10.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: //back button,
              Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    color: ColorPalette.themeColor,
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          title: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              //logo.png
              Image.asset(
                'assets/logo.png',
                height: 50,
              ),
              const Text(
                '',
                style: TextStyle(
                    color: ColorPalette.themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 9),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        drawer: const Drawer(child: DrawerHome()),
        body: _children[_currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? ColorPalette.textColor : Colors.grey.shade100;
            return Container(
              margin: EdgeInsets.all(3),
              child: Icon(
                iconList[index],
                size: 24,
                color: color,
              ),
            );
          },
          splashColor: ColorPalette.textColor,
          splashSpeedInMilliseconds: 500,
          backgroundColor: ColorPalette.themeColor,
          activeIndex: _currentIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
