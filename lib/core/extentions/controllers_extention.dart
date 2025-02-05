import 'package:coaching_app/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

extension ResponsiveExtention on BuildContext {
  AuthCubit get authController => AuthCubit.getAuthController(this);
}
