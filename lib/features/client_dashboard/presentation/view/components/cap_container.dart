import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

GestureDetector capContainer(
    {required BuildContext context,
    required GestureTapCallback onTap,
    required String image,
    required String name}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: context.heightReponsive * 0.22,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        color: AppColors.white.withOpacity(0.35),
        child: Center(
            child: Padding(padding: EdgeInsets.only(bottom: 25, left: 10),
              child: Align(alignment: Alignment.bottomLeft,
                child: Text(name,
                    style: TextStyles.customFontForCap(context)),
              ),
            )),
      ),
    ),
  );
}
