import 'package:flutter/material.dart';
import 'package:untitled4/core/excisions/excisions.dart';
import 'package:untitled4/models/mostrecentwedget.dart';
// import 'package:islami_c16/core/excisions%20/excisions.dart';
// import 'package:islami_c16/models/sura.dart';
//
// import '../../../../../core/theme/app_colors.dart';
import '../../../models/sura.dart';

class SuraCard extends StatelessWidget {
  final GlobalKey<MostrecentwedgetState> mostrecentkey;
  final Sura sura;
  const SuraCard({super.key, required this.sura,required this.mostrecentkey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sura_ver.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              sura.id.toString(),
              style: context.appTextTheme.labelLarge
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sura.suraNameEn,
                  style: context.appTextTheme.labelLarge
                ),
                SizedBox(height: 7),
                Text(
                  sura.ayaNumbers,
                  style: context.appTextTheme.labelLarge
                ),
              ],
            ),
          ),
          Text(
            sura.suraNameAr,
            style: context.appTextTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
