import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/coach_dashboard/view/components/earnings_container.dart';
import 'package:flutter/material.dart';

class EarningsAndPerformancePage extends StatelessWidget {
  const EarningsAndPerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Center(
              child: Text(
                'Earnings & Performance',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total Earnings This Month',
              style: TextStyles.quarterBold25(context, color: AppColors.black),
            ),
            earningsContainer(context: context, text: '20000 le'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total Clients This Month',
              style: TextStyles.quarterBold25(context, color: AppColors.black),
            ),
            earningsContainer(context: context, text: '20 client')
          ],
        ),
      ),
    );
  }
}
