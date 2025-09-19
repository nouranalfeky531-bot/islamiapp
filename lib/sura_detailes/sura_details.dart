import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled4/core/excisions/excisions.dart';
import 'package:untitled4/tabs/quran_tab/quran_tab.dart';
import '../core/themes/app_colors.dart';
import '../models/sura.dart';

class SuraDetails extends StatefulWidget {
  static const String route = 'sura Details';
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  suradetailsargument? sura;

  String suraDetails = '';
  List<String> ayat = [];
  @override
  void dispose() {
    // TODO: implement dispose
    sura?.mostrecentkey.currentState?.fetshMostrecent();


    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    sura ??= ModalRoute.of(context)!.settings.arguments as suradetailsargument;
    if (suraDetails.isEmpty) {
      readSura(sura?.sura.id ?? 0);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColor.secondaryColor),
        ),
        title: Text(sura?.sura.suraNameEn ?? ""),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Soura Details Screen.png'),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/img_left_corner.png'),
                  Text(
                    sura?.sura.suraNameAr ?? "",
                    style: context.appTextTheme.bodyLarge,
                  ),
                  Image.asset('assets/images/img_right_corner.png'),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: ayat.map((aya) {
                    int index = ayat.indexOf(aya);
                    return TextSpan(
                      text: aya,
                      children: [
                        TextSpan(
                          text: " [${index + 1}] ",
                          style: context.appTextTheme.labelLarge,
                        ),
                      ],
                    );
                  }).toList(),
                  style: context.appTextTheme.labelLarge!.copyWith(
                    color: context.appTheme.colorScheme.secondary,
                    height: 2,
                  ),
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readSura(int id) async {
    suraDetails = await rootBundle.loadString('assets/suras/Suras/${id}.txt');
    ayat = suraDetails.trim().split('\n');
    setState(() {});
  }
}
