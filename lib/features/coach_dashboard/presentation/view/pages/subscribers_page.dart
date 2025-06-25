import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/controller/cubit/get_subscribers_cubit.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/components/subscriber_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coaching_app/core/theme/text_styles.dart';

class SubscribersPage extends StatelessWidget {
  const SubscribersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<GetSubscribersCubit>()..getSubscribers(),
      child: 
        
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Subscribers',
                  style:
                      TextStyles.semiBold32(context, color: AppColors.black)),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<GetSubscribersCubit, GetSubscribersState>(
                builder: (context, state) {
                  return getWidgetDependingOnReuestState(
                    requestStateEnum: state.getSubscribersState,
                    erorrMessage: state.getSubscribersErrorMessage,
                    widgetIncaseSuccess: Expanded(
                      child: state.subscribers.isEmpty
                          ? Center(
                              child: Text(
                                'No Subscribers',
                                style: TextStyles.regular16_120(context,
                                    color: AppColors.grey),
                              ),
                            )
                          : ListView.separated(
                              itemCount: state.subscribers.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final subscriber = state.subscribers[index];
                                return SubscriberWidget(subscriber: subscriber);
                              },
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }
}
