import 'package:coaching_app/core/widgets/custom_snake_bar.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/domain/usecases/make_payment_use_case.dart';
import 'package:dartz/dartz.dart';

class StripeController {
  final MakePaymentUseCase makePaymentUseCase;

  StripeController(this.makePaymentUseCase);

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel,
      required Function(Unit) ifRight}) async {
    final result =
        await makePaymentUseCase(parameters: paymentIntentInputModel);

    result.fold(
      (l) {
        AppSnackBar.show(message: l.message, type: SnackBarType.error);
      },
      ifRight,
    );
  }
}
