import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_coach_plan_by_coach_cubit.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_subscription_plans_cubit.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/request_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribtionPlansPage extends StatelessWidget {
  const SubscribtionPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            locator<GetSubscriptionPlansCubit>()..getSubscriptionPlans(),
        child: BlocBuilder<GetCoachPlanByCoachCubit, GetCoachPlanByCoachState>(
          builder: (context, state) {
            switch (state) {
              case GetSubscriptionPlanByCoachLoading():
                return CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.primaryColor);
              case GetSubscriptionPlanByCoachSuccess():
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return requestContainer(
                        context: context,
                        planEntity: state.subscriptionPlans[index]);
                  },
                  itemCount: state.subscriptionPlans.length,
                );
              case GetSubscriptionPlanByCoachFailed():
                return ErrorWidget(state.errorMessage);
            }
          },
        ));
  }
}
