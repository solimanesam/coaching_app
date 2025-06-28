import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_coach_plan_by_coach_cubit.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/request_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class MyPackages extends StatelessWidget {
  const MyPackages({super.key, required this.coashName});
  final String coashName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: arrowBackButton(onPressed: () {
          Get.back();
        }),
      ),
      body: BlocProvider(
        create: (context) => GetCoachPlanByCoachCubit(locator())
          ..getCoachPlanByCoach(
              subscriptionPlanByCoachInputModel:
                  SubscriptionPlanByCoachInputModel(coashName: coashName)),
        child: BlocBuilder<GetCoachPlanByCoachCubit, GetCoachPlanByCoachState>(
          builder: (context, state) {
            if (state is GetSubscriptionPlanByCoachLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetSubscriptionPlanByCoachFailed) {
              return Center(child: Text(state.errorMessage));
            } else if (state is GetSubscriptionPlanByCoachSuccess) {
              final subscriptionPlans = state.subscriptionPlans;
      
              if (subscriptionPlans.isEmpty) {
                return const Center(child: Text('No packages found.'));
              }
      
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('My Packages', style: TextStyles.semiBold32(context,color: AppColors.black)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: subscriptionPlans.length,
                        itemBuilder: (context, index) {
                          final plan = subscriptionPlans[index];
                            
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Package ${index + 1}',
                                style: TextStyles.quarterBold32(
                                  context,
                                  color: AppColors.black,
                                ),
                              ),
                              requestContainer(
                                context: context,
                                planEntity: plan,
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
      
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
