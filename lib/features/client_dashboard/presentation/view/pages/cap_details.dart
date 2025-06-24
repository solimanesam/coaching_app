import 'package:coaching_app/core/extentions/responsive_extentions.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/utils/enums.dart';
import 'package:coaching_app/core/widgets/custom_button.dart';
import 'package:coaching_app/features/client_dashboard/data/models/subscribe_input_model.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/subscribe_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/custom_row_for_cap_details.dart';
import 'package:coaching_app/features/payment_integration/data/models/payment_intent_input_model.dart';
import 'package:coaching_app/features/payment_integration/presentation/view/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CapDetails extends StatelessWidget {
  const CapDetails({super.key, required this.coachEntity});

  final CoachEntity coachEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left,
                color: AppColors.black,
                size: 30,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.widthResponsive * .4,
                width: context.widthResponsive * .4,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(context.widthResponsive * .25),
                    image: DecorationImage(
                        image: AssetImage(coachEntity.image),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            customRowForCapDetails(context: context, text: coachEntity.name),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<SubscribeController>(
              builder: (controller) => customButton(
                  customButtonInputModel: CustomButtonInputModel(
                context: context,
                buttonName:
                    controller.createCoachPlanState == RequestStateEnum.loading
                        ? 'Loading...'
                        : 'Subscribe Now',
                onPressedFunction: () => Get.to(PaymentMethodsPage(
                  paymentIntentInputModel:
                      PaymentIntentInputModel(amount: '', currency: ''),
                  ifRight: (r) {
                    Get.back(canPop: true);
                    controller.subscribe(SubscribeInputModel());
                  },
                )),
              )),
            )
          ],
        ),
      ),
    );
  }
}
