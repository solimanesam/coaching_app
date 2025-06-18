import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/core/utils/base_use_case.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/domain/repos/base_payment_repo.dart';
import 'package:dartz/dartz.dart';

class MakePaymentUseCase
    extends BaseUseCaseWithParameters<Unit, PaymentIntentInputModel> {
  final BasePaymentRepo basePaymentRepo;
  MakePaymentUseCase(this.basePaymentRepo);
  @override
  Future<Either<Failure, Unit>> call(
      {required PaymentIntentInputModel parameters}) async {
    return await basePaymentRepo.makePayment(parameters);
  }
}
