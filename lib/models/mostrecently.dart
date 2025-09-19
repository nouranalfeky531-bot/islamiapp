import 'package:flutter/material.dart';
import 'package:untitled4/core/excisions/excisions.dart';
import 'package:untitled4/core/themes/app_colors.dart';
import 'package:untitled4/models/sura.dart';

class Mostrecently extends StatelessWidget {
  const Mostrecently( {super.key,required this.sura});
  final Sura sura;

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Text("Most Recent",style: context.appTextTheme.bodyMedium,),
        SizedBox(
          height: 160,

          child:Container(
            decoration: BoxDecoration(
              color: AppColor.secondaryColor.withValues(alpha: 1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(sura.suraNameEn,style:TextStyle(color: AppColor.primaryColor,fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(sura.suraNameAr,style: TextStyle(color: AppColor.primaryColor,fontSize: 20)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(sura.ayaNumbers+ "verses",style:TextStyle(color: AppColor.primaryColor,fontSize: 15)),
                    ),
                  ],
                ),
                Image.asset("assets/images/mostRecenet.png",color: AppColor.primaryColor,),
              ],

            ),



          ) ,

        ),
      ],
    );
  }
}
