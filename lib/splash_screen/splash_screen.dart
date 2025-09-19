import 'package:flutter/material.dart';
import 'package:untitled4/core/themes/app_colors.dart';
import 'package:untitled4/onboarding/onboardmanager.dart';
import 'package:untitled4/screens/home.dart';
import 'package:untitled4/screens/homescreen.dart';
// import 'package:islami_c16/core/theme/app_colors.dart';
// import 'package:islami_c16/modules/layout/home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  static const String route = 'lol';


  @override
  State<SplashScreen> createState() => _SplashScreenState();
 }
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();


class _SplashScreenState extends State<SplashScreen> {
  var onboards = GlobalKey<OnboardmanagerState>;
 late bool isopened;
  get()async{
    isopened=   await OnboardmanagerState.getvalue();
    setState(() {

    });

  }

  @override
  void dispose() {
  // TODO: implement dispose

  super.dispose();
  }

  @override
  void initState() {
    super.initState();
    get();
    Future.delayed(Duration(seconds: 3), () {
      if (isopened == true) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => Onboardmanager()),
        );
      }
      //   Home.route, (_) => false
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Center(child: Image.asset("assets/images/OBJECTS(1).png")),
            Spacer(),
            SafeArea(
              child: Image.asset("assets/images/routelogo.png", width: 250),
            ),
          ],
        ),
      ),
    );
  }
}
