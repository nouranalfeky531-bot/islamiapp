import 'package:flutter/material.dart';
import 'package:untitled4/core/excisions/excisions.dart';
import 'package:untitled4/core/prefsmanager.dart';
import 'package:untitled4/models/mostrecently.dart';
import 'package:untitled4/models/sura.dart';

class Mostrecentwedget extends StatefulWidget {
  const Mostrecentwedget({super.key,});


  @override
  State<Mostrecentwedget> createState() => MostrecentwedgetState();
}

class MostrecentwedgetState extends State<Mostrecentwedget> {
  List<Sura>most_recent=[];
  fetshMostrecent()async{
    most_recent=await PrefsManager.getMostRecentSuras();
    setState(() {});
    print('the suras num=${most_recent.length}');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetshMostrecent();
  }
 late int num=most_recent.length;

  @override
  Widget build(BuildContext context) {
   print("the suras num${num}");
    return Visibility(
      visible: most_recent.isEmpty?false:true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text("Most Recent",style: context.appTextTheme.bodyMedium,),
          SizedBox(
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: most_recent.length,
                separatorBuilder:(context,index)=>SizedBox(width:10 ,),
                itemBuilder:(context,index)=>Mostrecently(sura: most_recent[index],),
            ),
          ),
        ],
      ),
    );
  }
}
