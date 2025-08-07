import 'package:flutter/material.dart';
import 'package:money_transfer/Core/utils/image.dart';
import 'package:money_transfer/provider/bottom_nav_bar.dart';
import 'package:money_transfer/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, BottomBarProvider provider, child) {
          switch (provider.currentIndex) {
            case 0:
              return HomeScreen();
            case 1:
              return Center(child: Text('Search'));
            case 2:
              return Center(child: Text('Profile'));
            default:
              return Center(child: Text('Unknown'));
          }
        },
      ),

      bottomNavigationBar: Consumer(
        builder: (context, BottomBarProvider provider, child) {
          return Container(
            padding: EdgeInsets.all( 1.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.black,
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                stops: const [0.5, 1.0, 0.5],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildItem(homeIcon, 0, provider),
                buildItem(walletIcon, 1, provider),
                buildItem(settingIcon, 2, provider),
                buildItem(profileIcon, 3, provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildItem(String icon, int index, BottomBarProvider provider) {
    bool isSelected = provider.currentIndex == index;
    return IconButton(
      onPressed: () {
        provider.changeTab(index);
      },
      icon: SvgPicture.asset(
        icon,
        color: isSelected ? Colors.white : Colors.grey,

        height: 3.6.h,
      ),
    );
  }
}
