import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_coach_plan_by_coach_cubit.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/request_container.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/create_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetCoachPlanByCoachCubit>()
        ..getCoachPlanByCoach(
            subscriptionPlanByCoachInputModel:
                SubscriptionPlanByCoachInputModel()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
          child: Column(
            children: [
              Text(
                'Packages',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(child: BlocBuilder<GetCoachPlanByCoachCubit,
                  GetCoachPlanByCoachState>(
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

                    return ListView.builder(
                      itemCount: subscriptionPlans.length,
                      itemBuilder: (context, index) {
                        final plan = subscriptionPlans[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Package ${index + 1}',
                              style: TextStyles.quarterBold32(context,
                                  color: AppColors.black),
                            ),
                            requestContainer(
                              context: context,
                              planEntity: plan,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  }

                  // حالة افتراضية في حالة مفيش أي حالة متوقعة
                  return const SizedBox.shrink();
                },
              )),
              SizedBox(
                height: 10,
              ),
              customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName: 'Add new',
                onPressedFunction: () {
                  Get.to(() => const CreatePackage());
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
