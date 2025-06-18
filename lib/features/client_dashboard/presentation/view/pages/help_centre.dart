import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/FAQ_details.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/contact_us_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_circle_left,
              color: AppColors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        body: Column(
          spacing: 20,
          children: [
            Center(
                child: Text('Help Center',
                    style: TextStyles.semiBold32(context,
                        color: AppColors.black))),
            TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 6, color: AppColors.primaryColor)),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.grey,
              labelStyle:
                  TextStyles.semiBold20(context, color: AppColors.primaryColor),
              tabs: [
                Tab(text: "FAQ"),
                Tab(text: "CONTACT US"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FaqDetails(),
                  ContactUsTabView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
