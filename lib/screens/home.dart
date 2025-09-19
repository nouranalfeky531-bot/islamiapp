import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/themes/app_colors.dart';
import '../tabs/hadeth_tab/hadeth_tab.dart';
import '../tabs/quran_tab/quran_tab.dart';
import '../tabs/radio_tab/radio_tab.dart';
import '../tabs/sebha_tab/sebha_tab.dart';
import '../tabs/time_tab/time_tab.dart';
// import 'package:islami_c16/core/theme/app_colors.dart';
// import 'package:islami_c16/modules/layout/tabs/hadeth_tab/hadeth_tab.dart';
// import 'package:islami_c16/modules/layout/tabs/quran_tab/quran_tab.dart';
// import 'package:islami_c16/modules/layout/tabs/radio_tab/radio_tab.dart';
// import 'package:islami_c16/modules/layout/tabs/sebha_tab/sebha_tab.dart';
// import 'package:islami_c16/modules/layout/tabs/time_tab/time_tab.dart';

class Home extends StatefulWidget {
  static const String route = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.secondaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: AppColor.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/quran.svg'),
            label: 'Quran',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/hadeth.svg'),
            label: 'Hadeth',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                'assets/icons/hadeth.svg',
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_sebha.svg'),
            label: 'Sebha',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                'assets/icons/ic_sebha.svg',
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_radio.svg'),
            label: 'Radio',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                'assets/icons/ic_radio.svg',
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/ic_time.svg'),
            label: 'Time',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(66),
              ),
              child: SvgPicture.asset(
                'assets/icons/ic_time.svg',
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: tabs[currentIndex] ,
    );
  }
}
