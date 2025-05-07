import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FeesAndPayment extends StatelessWidget {
  const FeesAndPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Payment & Fees',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Outstanding Fees : 2000 le',
              style: TextStyles.quarterBold25(context, color: AppColors.black),
            ),
            Row(
              children: [
                Spacer(),
                customButton(
                    customButtonInputModel: CustomButtonInputModel(
                  context: context,
                  buttonName: 'pay now',
                  onPressedFunction: () {},
                  width: context.width * 0.5,
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Transaction:',
              style: TextStyles.quarterBold25(context, color: AppColors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ...transaction(),
            Spacer(),
            Center(child: footer(context))
          ],
        ),
      ),
    );
  }

  Column footer(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        customButton(
            customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName: 'Request Withdrawal',
                onPressedFunction: () {})),
        Text(
          '"Minimum withdrawal amount: 500 le"',
          style: TextStyles.regular16_120(context, color: AppColors.black),
        )
      ],
    );
  }

  List<Widget> transaction() {
    return List.generate(
      3,
      (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('--'),
            Text('--'),
            Text('--'),
          ],
        );
      },
    );
  }
}
