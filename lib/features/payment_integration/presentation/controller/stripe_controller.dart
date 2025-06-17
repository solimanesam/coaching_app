import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/domain/usecases/make_payment_use_case.dart';
import 'package:get/get.dart';

class StripeController extends GetxController {
  final MakePaymentUseCase makePaymentUseCase;

  StripeController(this.makePaymentUseCase);

  // Observables (تعبر عن الحالة)
  RequestStateEnum? requestState;
  var errorMessage = ''.obs;
  var activeButton = 1.obs;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    requestState = RequestStateEnum.loading;

    final result =
        await makePaymentUseCase(parameters: paymentIntentInputModel);

    result.fold(
      (l) {
        errorMessage.value = l.message;
        requestState = RequestStateEnum.failed;
      },
      (r) {
        requestState = RequestStateEnum.success;
      },
    );
  }

  void updateActiveButton() {
    activeButton.value = (activeButton.value == 1) ? 2 : 1;
  }
}
