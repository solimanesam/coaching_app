import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_subscription_plans_cubit.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/subscribe_controller.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/request_container.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/presentation/view/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SubscriptionPlansPage extends StatelessWidget {
  const SubscriptionPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> selectedPlanNotifier = ValueNotifier(null);
    int? planId;
    String? amount;

    return BlocProvider(
      create: (context) => GetSubscriptionPlansCubit(locator())
        ..getSubscriptionPlans(),
      child: 
       Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              Text(
                'Packages',
                style: TextStyles.semiBold32(context, color: AppColors.black),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: BlocBuilder<GetSubscriptionPlansCubit, GetSubscriptionPlansState>(
                  builder: (context, state) {
                    if (state is GetSubscriptionPlansLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetSubscriptionPlansFailed) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is GetSubscriptionPlansSuccess) {
                      final subscriptionPlans = state.subscriptionPlans;

                      if (subscriptionPlans.isEmpty) {
                        return const Center(child: Text('No packages found.'));
                      }

                      return ListView.builder(
                        itemCount: subscriptionPlans.length,
                        itemBuilder: (context, index) {
                          final plan = subscriptionPlans[index];
                          final isSelected = selectedPlanNotifier.value == index;

                          return GestureDetector(
                            onTap: () {
                              planId = plan.id;
                              amount = plan.price.toString();
                              selectedPlanNotifier.value = isSelected ? null : index;
                            },
                            child: Column(
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
                                  nameCoach: true,
                                  context: context,
                                  planEntity: plan,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
              ValueListenableBuilder<int?>(
                valueListenable: selectedPlanNotifier,
                builder: (context, selectedIndex, _) {
                  if (selectedIndex == null) return const SizedBox.shrink();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<SubscribeController>(
                        builder: (controller) => customButton(
                          customButtonInputModel: CustomButtonInputModel(
                            context: context,
                            width: context.widthResponsive * 0.6,
                            buttonName: controller.createCoachPlanState ==
                                    RequestStateEnum.loading
                                ? 'Loading...'
                                : 'Subscribe',
                            onPressedFunction: () {
                              if (planId != null && amount != null) {
                                Get.to(PaymentMethodsPage(
                                  paymentIntentInputModel: PaymentIntentInputModel(
                                    amount: amount!,
                                    currency: 'USD',
                                  ),
                                  ifRight: (r) {
                                    Get.back(canPop: true);
                                    controller.subscribe(
                                      SubscribeInputModel(planId: planId!),
                                    );
                                  },
                                ));
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () => selectedPlanNotifier.value = null,
                        icon: Icon(
                          Icons.close,
                          color: AppColors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}
