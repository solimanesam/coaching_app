import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';


abstract class BasePaymentRepo {
  Future<Either<Failure, Unit>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel);
}
