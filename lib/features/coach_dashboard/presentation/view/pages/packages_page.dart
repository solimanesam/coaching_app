import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/arrow_back_button.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscription_plan_by_coach_input_model.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/cubit/get_coach_plan_by_coach_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackagesPage extends StatelessWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetCoachPlanByCoachCubit>()..getCoachPlanByCoach(subscriptionPlanByCoachInputModel: SubscriptionPlanByCoachInputModel()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: arrowBackButton(
              onPressed: () {},
            ),
          ),
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
                Expanded(child: BlocBuilder<GetCoachPlanByCoachCubit, GetCoachPlanByCoachState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'package${index + 1}',
                              style: TextStyles.quarterBold32(context,
                                  color: AppColors.black),
                            ),
                            // requestContainer(
                            //     context: context,
                            //    planEntity: pla),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      itemCount: 10,
                    );
                  },
                )),
                SizedBox(
                  height: 10,
                ),
                customButton(
                    customButtonInputModel: CustomButtonInputModel(
                  context: context,
                  buttonName: 'Add new',
                  onPressedFunction: () {},
                ))
              ],
            ),
          ),
        ),
    );
  }
}
