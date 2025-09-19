import 'package:untitled4/models/sura.dart';

import '../core/app_const/app_const.dart';

class Suramodel {
static List<Sura>sura = addsura();
}


List<Sura>addsura(){
  List<Sura>suras=[];
  for (int i = 0; i < arabicAuranSuras.length; i++) {
    suras.add(
      Sura(
        id: i + 1,
        ayaNumbers: AyaNumber[i],
        suraNameAr: arabicAuranSuras[i],
        suraNameEn: englishQuranSurahs[i],
      ),
    );
  }
  return suras;
}