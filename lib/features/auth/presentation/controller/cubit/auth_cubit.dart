import 'package:coaching_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit getAuthController(BuildContext context) {
    final AuthCubit controller = context.read<AuthCubit>();
    return controller;
  }

  AuthCubit() : super(const AuthState());

  isActive(int active){
    emit(AuthState(active: active));
  }

  isSecureActive(bool isSecure) {
    if (isSecure == true) {
      isSecure = false;
    } else {
      isSecure = true;
    }
    print(isSecure);
    emit(
      AuthState(isSecure: isSecure),
    );
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

//   Future<void> signUp() async {
//     if (formkey.currentState!.validate()) {
//       emit(const AuthState(signUpState: RequestStateEnum.loading));
//       final result = await signUpUseCase(
//           parameters: SignUpModel(
//               email: emailController.text,
//               userName: usernameController.text,
//               password: passwordController.text,
//               phoneNumber: phoneNumerController.text));
//       result.fold(
//         (l) => emit(AuthState(
//             signUpState: RequestStateEnum.failed, signUpmessage: l.message)),
//         (r) => emit(const AuthState(
//             signUpState: RequestStateEnum.success,
//             signUpmessage: ViewConstants.signUpSuccessfully)),
//       );
//     }
//   }

//   Future<void> login() async {
//     if (logInFormkey.currentState!.validate()) {
//       emit(const AuthState(logInState: RequestStateEnum.loading));

//       final result = await logInUseCase(
//           parameters: LogInInputModel(
//               email: logInEmailController.text,
//               password: logInPasswordController.text));
//       result.fold(
//           (l) => emit(
//                 AuthState(
//                     logInmessage: l.message,
//                     logInState: RequestStateEnum.failed),
//               ), (r) {
//         ApiConstant.token = r.token ?? '';
//         sl
//             .get<BaseAuthLocalDataSource>()
//             .insertTokenToCache(token: r.token ?? '');

//         emit(const AuthState(
//             logInState: RequestStateEnum.success,
//             logInmessage: ViewConstants.logInSuccessfully));
//         // goToDashboard(context);
//       });
//     }
//   }

// //navigation
//   void goToDashboard(BuildContext context) {
//     context.pushReplacement('/dashboard');
//   }

//   static void goToSignUpPage(BuildContext context) {
//     context.pushReplacement('/signup');
//   }

//   static void goToLogInPage(BuildContext context) {
//     context.pushReplacement('/login');
//   }
}
