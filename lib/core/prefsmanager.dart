import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/models/sura.dart';
import 'package:untitled4/models/suramodel.dart';
import 'package:untitled4/tabs/quran_tab/quran_tab.dart';
import 'package:untitled4/tabs/quran_tab/widgets/sura_card.dart';

class PrefsManager{
static Future<void> setprfs(String suraindex)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  List<String>most_resent_suras_index=prefs.getStringList("most_recent_suras",)??[];
  if(most_resent_suras_index.contains(suraindex)){
    most_resent_suras_index.remove(suraindex);
  }
  if(most_resent_suras_index.length>7){
    most_resent_suras_index.remove(most_resent_suras_index.first);
  }
  most_resent_suras_index.add(suraindex);
  prefs.setStringList("most_recent_suras", most_resent_suras_index);
 //  int index=int.parse(suraindex);
 //  Sura name =Suramodel.sura[index];
 // String arname= name.suraNameAr;
 //
 //  print(arname);
}
static Future<List<Sura>> getMostRecentSuras()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
 List<String> most_resent_suras_index=prefs.getStringList("most_recent_suras")??[];
 List<Sura>MostRecentSuras=[];
 for(int i=0;i < most_resent_suras_index.length;i++){
      int index=int.parse(most_resent_suras_index[i]);
   //    // Sura sura=Sura
  MostRecentSuras.add(Suramodel.sura[index]);
  // print("the suras number=${MostRecentSuras.length}");
 }
return MostRecentSuras.reversed.toList();
}
}
