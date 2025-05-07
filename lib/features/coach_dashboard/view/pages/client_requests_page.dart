import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/coach_dashboard/view/components/request_container.dart';
import 'package:flutter/material.dart';

class ClientRequestsPage extends StatelessWidget {
  const ClientRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          spacing: 30,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'client Requests',
              style: TextStyles.semiBold32(context, color: AppColors.black),
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: requestContainer(
                          context: context,
                          text1: 'ali ahmed',
                          text2: '3month',
                          buttonName1: 'accept',
                          buttonName2: 'reject'),
                    );
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
