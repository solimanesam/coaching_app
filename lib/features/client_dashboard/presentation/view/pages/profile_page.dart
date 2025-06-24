import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/core/widgets/profile_image_widget.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/list_tile_widget.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/settings_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/subscribers_page.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/upload_certifcate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileOptions = [
      {
        'icon': Icons.upload_file_rounded,
        'title': 'Upload Certificates',
        'page': () => const UploadCertifcatePage(),
      },
      {
        'icon': Icons.group,
        'title': 'Subscribers',
        'page': () => const SubscribersPage(),
      },
      {
        'icon': Icons.settings_outlined,
        'title': 'Settings',
        'page': () => const SettingsPage(),
      },
      {
        'icon': Icons.lock_outline,
        'title': 'Help center',
        'page': null,
      },
      {
        'icon': Icons.logout,
        'title': 'Log out',
        'page': null,
      },
    ];

    return Column(
      children: [
        GetBuilder<ProfileController>(builder: (profileController) {
          return getWidgetDependingOnReuestState(
              requestStateEnum: profileController.getProfileState,
              widgetIncaseSuccess: profileController.profileInfo == null
                  ? SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileImageWidget(
                          image: profileController.profileInfo!.image,
                        ),
                        Column(children: [
                          Text(
                            profileController.profileInfo!.userName,
                            style: TextStyles.semiBold32(context,
                                color: AppColors.black),
                          ),
                          Text(
                            profileController.profileInfo!.email,
                            style: TextStyles.quarterBold32(context,
                                color: AppColors.black),
                          )
                        ])
                      ],
                    ),
              erorrMessage: profileController.getProfileErrorMess);
        }),
        ...List.generate(
          profileOptions.length,
          (index) => ListTileWidget(
            icon: profileOptions[index]['icon'],
            title: profileOptions[index]['title'],
            onTab: () {
              final page = profileOptions[index]['page'];
              if (page != null) {
                Get.to(page); // لاحظ إنها function, مش Widget مباشرة
              } else {
                // تسجيل الخروج مثلاً
                
              }
            },
          ),
        )
      ],
    );
  }
}
