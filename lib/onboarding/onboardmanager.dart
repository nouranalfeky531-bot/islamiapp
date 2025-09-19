import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/core/themes/app_colors.dart';
import 'package:untitled4/screens/home.dart';

class Onboardmanager extends StatefulWidget {
  Onboardmanager({super.key});
  static const String route = "on board";

  @override
  State<Onboardmanager> createState() => OnboardmanagerState();
}

class OnboardmanagerState extends State<Onboardmanager> {
  // static bool isopened = false;
   static  getvalue() async {
   bool isopened = await getprefs();
   return isopened;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Image(image: AssetImage("assets/images/applogo.png")),

          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 20),

              Center(
                child: Image(image: AssetImage("assets/images/hellopage.png")),
              ),
              Text("Welcome to islamiapp "),
            ],
          ),

          // image: const Center(child:Image(image: AssetImage("assets/images/hellopage.png")) ),
        ),
        PageViewModel(
          titleWidget: Image(image: AssetImage("assets/images/applogo.png")),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 20),
              Center(
                child: Image(image: AssetImage("assets/images/board2.png")),
              ),
              Text(
                "Welcome to islami ",
                style: TextStyle(fontSize: 25, color: AppColor.secondaryColor),
              ),
              SizedBox(height: 25),
              Text(
                "We Are Very Excitedn to Have You in our \n                      Community",
                style: TextStyle(fontSize: 17, color: AppColor.secondaryColor),
              ),
            ],
          ),

          // image: const Center(child:Image(image: AssetImage("assets/images/hellopage.png")) ),
        ),
        PageViewModel(
          titleWidget: Image(image: AssetImage("assets/images/applogo.png")),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 20),

              Center(
                child: Image(image: AssetImage("assets/images/frame3.png")),
              ),
              Text(
                "Read the Quran ",
                style: TextStyle(fontSize: 25, color: AppColor.secondaryColor),
              ),
              SizedBox(height: 20),
              Text(
                "Read, and your lord is the most generous",
                style: TextStyle(fontSize: 17, color: AppColor.secondaryColor),
              ),
            ],
          ),

          // image: const Center(child:Image(image: AssetImage("assets/images/hellopage.png")) ),
        ),

        PageViewModel(
          titleWidget: Image(image: AssetImage("assets/images/applogo.png")),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Image(image: AssetImage("assets/images/applogo.png")),
              Center(
                child: Image(image: AssetImage("assets/images/Frame 3(3).png")),
              ),

              Text(
                "Bearish",
                style: TextStyle(fontSize: 25, color: AppColor.secondaryColor),
              ),
              SizedBox(height: 50),
              Text(
                "prase the name of your lord ,the most \n                           High",
                style: TextStyle(fontSize: 20, color: AppColor.secondaryColor),
              ),
            ],
          ), // image: const Center(child:Image(image: AssetImage("assets/images/hellopage.png")) ),
        ),
        PageViewModel(
          titleWidget: Image(image: AssetImage("assets/images/applogo.png")),
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Image(image: AssetImage("assets/images/applogo.png")),
              SizedBox(height: 20),
              Center(
                child: Image(image: AssetImage("assets/images/Frame 3(4).png")),
              ),

              Text(
                "Holy Quran Radio ",
                style: TextStyle(fontSize: 25, color: AppColor.secondaryColor),
              ),
              SizedBox(height: 40),
              Text(
                "   you can listen to the holy quran radio \n through the application for free and easily",
                style: TextStyle(fontSize: 17, color: AppColor.secondaryColor),
              ),
            ],
          ), // image: const Center(child:Image(image: AssetImage("assets/images/hellopage.png")) ),
        ),
      ],
      // showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done"),
      onDone: () {
        setprefs(true);
        Navigator.pushNamed(context, Home.route);
      },
      baseBtnStyle: TextButton.styleFrom(
        shadowColor: Colors.amber,
        backgroundColor: Colors.transparent,
      ),
      // skipStyle: TextButton.styleFrom(priy: marColors.red),
      doneStyle: TextButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.secondaryColor,
      ),
      nextStyle: TextButton.styleFrom(foregroundColor: AppColor.secondaryColor),
    );
  }
}

Future<void> setprefs(state) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
 bool whatstate=  prefs.getBool("intro_seen")??false;
  if(whatstate==true){
   whatstate=state;
  }

  prefs.setBool("intro_seen",whatstate?? false);

  print("======================================");

  print(state);
  print("======================================");
}

Future<bool> getprefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen;
  return seen = prefs.getBool("intro_seen") ?? false;
}
