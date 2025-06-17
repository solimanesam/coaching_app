import 'package:coaching_app/core/errors/failures.dart';
import 'package:coaching_app/features/payment_integration/data/datasources/payment_remote_data_source.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/domain/repos/base_payment_repo.dart';
import 'package:dartz/dartz.dart';

class Paymentrepo extends BasePaymentRepo {
  PaymentRemoteDataSource paymentRemoteDataSource;
  Paymentrepo(this.paymentRemoteDataSource);
  @override
  Future<Either<Failure, Unit>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      await paymentRemoteDataSource.makePayment(paymentIntentInputModel);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
