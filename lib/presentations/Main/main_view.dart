import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/presentations/Main/booking/booking_screen.dart';
import 'package:pick_park/presentations/Main/favourite/favourite_screen.dart';
import 'package:pick_park/presentations/Main/home/home_screen.dart';
import 'package:pick_park/presentations/Main/settings/settings.dart';
import 'package:pick_park/presentations/Main/tags/tags.dart';
import 'package:pick_park/presentations/Main/the%20vehicle/vehicle_screen.dart';
import 'package:pick_park/shared/styles/colors.dart';

import '../resources/string_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomeScreen(),
    BookingScreen(),
    FavouriteScreen(),
    VehicleScreen(),
    Tags(),
    settings()

  ];
  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.book.tr(),
    AppStrings.favourite.tr(),
    AppStrings.theCar.tr(),
    AppStrings.tags,
    AppStrings.settings.tr(),


  ];

  var _title = AppStrings.home.tr();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.white)
        ]),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: defaultColor,
          unselectedItemColor:Colors.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items:   [
            BottomNavigationBarItem(icon:Icon(Icons.home),label: AppStrings.home.tr()),
            BottomNavigationBarItem(icon:Icon(Icons.list_alt),label: AppStrings.book.tr()),
            BottomNavigationBarItem(icon:Icon(Icons.bookmark),label: AppStrings.favourite.tr()),
            BottomNavigationBarItem(icon:Icon(Icons.directions_car),label: AppStrings.theCar.tr()),
            BottomNavigationBarItem(icon:Icon(Icons.tag),label: AppStrings.tags),
            BottomNavigationBarItem(icon:Icon(Icons.person),label: AppStrings.accountTittle.tr()),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }


  }
