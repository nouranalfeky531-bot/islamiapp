import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled4/core/excisions/excisions.dart';

import '../../../core/themes/app_colors.dart';
// import 'package:islami_c16/core/excisions%20/excisions.dart';

// import '../../../../../core/theme/app_colors.dart';

class SuraSeatchTextField extends StatelessWidget {
  final TextEditingController controller;
  const SuraSeatchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColor.white,
      style: TextStyle(color: AppColor.white, fontFamily: 'janadk'),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: AppColor.secondaryColor),
        ),
        filled: true,
        fillColor: AppColor.primaryColor.withValues(alpha: .5),
        hintText: 'Sura Name',
        hintStyle: context.appTextTheme.bodyMedium,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            'assets/icons/quran.svg',
            colorFilter: const ColorFilter.mode(
              AppColor.secondaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
