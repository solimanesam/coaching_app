import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/services/stripe_service.dart';
import 'package:coaching_app/features/payment_integration/data/datasources/payment_remote_data_source.dart';
import 'package:coaching_app/features/payment_integration/data/repos/paymentrepo.dart';
import 'package:coaching_app/features/payment_integration/domain/repos/base_payment_repo.dart';
import 'package:coaching_app/features/payment_integration/domain/usecases/make_payment_use_case.dart';

class PaymentDependencyInjection {
  static void init() {
/////////usecases
    locator.registerLazySingleton(() => MakePaymentUseCase(locator()));

//////////repos
    locator
        .registerLazySingleton<BasePaymentRepo>(() => Paymentrepo(locator()));

    /////datasource
    locator.registerLazySingleton<PaymentRemoteDataSource>(
        () => PaymentRemoteDataSourceImpl(locator()));
    locator.registerLazySingleton(() => StripeService(locator()));
  }
}
