import 'package:flutter/material.dart';
import 'package:untitled4/core/excisions/excisions.dart';
import 'package:untitled4/core/prefsmanager.dart';
import 'package:untitled4/models/mostrecently.dart';
import 'package:untitled4/models/mostrecentwedget.dart';
import 'package:untitled4/tabs/quran_tab/widgets/sura_card.dart';
import 'package:untitled4/tabs/quran_tab/widgets/sura_seatch_text_field.dart';
import '../../core/app_const/app_const.dart';
import '../../models/sura.dart';
import '../../sura_detailes/sura_details.dart';

class QuranTab extends StatefulWidget {
  static var quran;

  QuranTab({super.key});


  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<Mostrecently> mostresent=[];
  var mostrecentwiget=GlobalKey<MostrecentwedgetState>();


  TextEditingController search = TextEditingController();
 static List<Sura> quran = [];
  List<Sura> searched = [];
  @override
  void initState() {
    super.initState();
    readQuran();
    search.addListener(() {
      if (search.text.isEmpty) {
        searched = quran;
      } else {
        searched = quran
            .where(
              (sura) =>
                  sura.suraNameEn.trim().toLowerCase().contains(
                    search.text.trim().toLowerCase(),
                  ) ||
                  sura.suraNameAr.trim().contains(search.text.trim()),
            )
            .toList();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Home Screen.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/applogo.png'),
            SizedBox(height: 10),
            SuraSeatchTextField(controller: search),
            Mostrecentwedget(key: mostrecentwiget,),
            // Mostrecently(),
            Text(
              'Suras List',
              style: context.appTextTheme.bodyMedium,
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.separated(
                itemCount: searched.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    String suraindex=index.toString();
                    PrefsManager.setprfs(suraindex);
                    Navigator.pushNamed(
                      context,
                      SuraDetails.route,
                      arguments: suradetailsargument(sura: searched[index], mostrecentkey: mostrecentwiget),
                      // ,
                    );
                  },
                  child: SuraCard(sura: searched[index],mostrecentkey: mostrecentwiget,),
                ),
                separatorBuilder: (_, index) =>
                    Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  void readQuran() {
    for (int i = 0; i < arabicAuranSuras.length; i++) {
      quran.add(
        Sura(
          id: i + 1,
          ayaNumbers: AyaNumber[i],
          suraNameAr: arabicAuranSuras[i],
          suraNameEn: englishQuranSurahs[i],
        ),
      );
    }
    searched = quran;
  }
}

class suradetailsargument{
  Sura sura;
  GlobalKey<MostrecentwedgetState> mostrecentkey;
  suradetailsargument({required this.sura,required this.mostrecentkey});
}
