import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/responsive_extention.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<dynamic> appBottomSheet(
    {required BuildContext context,
    required String text1,
    required String text2,
    required void Function() onPressed}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      height: context.height * 1 / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 1 / 3),
            child: Divider(
              thickness: 5,
              color: AppColors.grey,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text1,
                style: TextStyles.semiBold32auto(context),
              ),
              Text(
                text2,
                style: TextStyles.regular16_120(context, color: AppColors.grey),
              ),
            ],
          ),
          BottomSheetButtons(
            onPressed: onPressed,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    ),
  );
}

class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          spacing: 30.0,
          children: [
            Expanded(
              child: OutlinedButton(
                  style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                          Size(double.infinity, context.height * 0.06)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: TextStyles.semiBold20(
                      context,
                      color: AppColors.black,
                    ),
                  )),
            ),
            Expanded(
              child: customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName: "Yes",
                onPressedFunction: onPressed,
              )),
            )
          ],
        ));
  }
}
