import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/features/client_dashboard/domain/entities/coash_entity.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/get_coaches_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/cap_container.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/cap_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 20,
        children: [
          TextField(
            onChanged: (value) =>
                Get.find<GetCoachesController>().search(string: value),
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: const Color(0xffF5F5F5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: AppColors.grey)),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          Expanded(
              child: GetBuilder<GetCoachesController>(builder: (controller) {
            final List<CoachEntity> coaches = controller.searchList.isEmpty
                ? controller.coaches
                : controller.searchList;
            return getWidgetDependingOnReuestState(
                requestStateEnum: controller.getCoachesState,
                widgetIncaseSuccess: ListView.builder(
                  itemCount: coaches.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: capContainer(
                              context: context,
                              image: coaches[index].image,
                              name: "Cap: ${coaches[index].name}",
                              onTap: () => Get.to(
                                  CapDetails(coachEntity: coaches[index])),
                            )),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  },
                ),
                erorrMessage: controller.getCoachesErrorMessage);
          }))
        ],
      ),
    );
  }
}
