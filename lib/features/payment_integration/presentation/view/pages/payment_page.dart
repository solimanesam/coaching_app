import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/payment_integration/presentation/view/component/payment_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: arrowBackButton(onPressed: () {}),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
              child: Text(
                'Payment Methods',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Credit Card',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            paymentOptionField(
              label: 'new card',
              context: context,
              onTap: () {},
            ),
            const SizedBox(height: 30),
            const Text(
              'More Options',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            paymentOptionField(
                label: 'Apple pay', context: context, onTap: () {}),
            const SizedBox(height: 10),
            paymentOptionField(
                label: 'Insta pay', context: context, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
