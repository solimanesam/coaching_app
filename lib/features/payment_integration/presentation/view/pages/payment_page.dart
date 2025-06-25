import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/presentation/controller/stripe_controller.dart';
import 'package:coaching_app/features/payment_integration/presentation/view/component/payment_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key, required this.paymentIntentInputModel, required this.ifRight});

  final PaymentIntentInputModel paymentIntentInputModel;
  final Function(Unit) ifRight;

  @override
  Widget build(BuildContext context) {
    List<Row> paymentMethodes = <Row>[
      paymentOptionField(
          label: 'Stripe',
          context: context,
          onTap: () => locator<StripeController>()
              .makePayment(paymentIntentInputModel: paymentIntentInputModel, ifRight: ifRight)),
      paymentOptionField(label: 'Insta pay', context: context, onTap: () {}),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: arrowBackButton(onPressed: Get.back),
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
                'Choose Payment Methods',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
            ),
            ...List.generate(
                paymentMethodes.length, (index) => paymentMethodes[index])
          ],
        ),
      ),
    );
  }
}
