import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/pages/edit_profile_page.dart';
import 'package:coaching_app/core/services/cache_service.dart';
import 'package:coaching_app/core/services/dependency_injection.dart';
import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/core/theme/text_styles.dart';
import 'package:coaching_app/core/widgets/get_widget_depending_on_reuest_state.dart';
import 'package:coaching_app/core/widgets/profile_image_widget.dart';
import 'package:coaching_app/features/auth/presentation/view/pages/log_in_page.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/getx_controllers/Client_bottom_nav_controller.dart.dart';
import 'package:coaching_app/features/client_dashboard/presentation/controllers/profile_controller.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/bottom_sheet_widget.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/components/list_tile_widget.dart';
import 'package:coaching_app/features/client_dashboard/presentation/view/pages/help_centre.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/create_package.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/my_packages.dart';
import 'package:coaching_app/features/coach_dashboard/presentation/view/pages/upload_certifcate_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachProfilePage extends StatelessWidget {
  const CoachProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future:
          locator<BaseCache>().getStringFromCache(key: CacheConstant.roleKey),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final userType = snapshot.data;

        return GetBuilder<ProfileController>(
          builder: (profileController) {
            final profile = profileController.profileInfo;

            final List<Map<String, dynamic>> profileOptions = [
              {
                'icon': userType == 'Coach'
                    ? Icons.upload_file_rounded
                    : Icons.lock_outline,
                'title':
                    userType == 'Coach' ? 'Upload Certificates' : 'Help center',
                'page': () => userType == 'Coach'
                    ? const UploadCertifcatePage()
                    : const HelpCenterScreen(),
              },
              if (userType == 'Coach')
                {
                  'icon': Icons.add_box_rounded,
                  'title': 'Add Package',
                  'page': () => const CreatePackage(),
                },
              if (userType == 'Coach')
                {
                  'icon': Icons.folder_copy_outlined,
                  'title': 'My Packages',
                  'page': () => MyPackages(
                        coashName: profile?.userName ?? '',
                      ),
                },
              {
                'icon': Icons.edit_note,
                'title': 'Edit Profile',
                'page': () => const EditProfilePage(),
              },
              {
                'icon': Icons.logout,
                'title': 'Log out',
                'page': null,
              },
            ];

            return getWidgetDependingOnReuestState(
              requestStateEnum: profileController.getProfileState,
              erorrMessage: profileController.getProfileErrorMess,
              widgetIncaseSuccess: Column(
                children: [
                  if (profile != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileImageWidget(image: profile.image),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(profile.userName,
                                style: TextStyles.semiBold20(context,
                                    color: AppColors.black)),
                            Text(profile.email,
                                style: TextStyles.quarterBold18(
                                    context: context, color: AppColors.black)),
                          ],
                        ),
                      ],
                    ),
                  const SizedBox(height: 32),
                  ...profileOptions.map(
                    (option) => ListTileWidget(
                      icon: option['icon'],
                      title: option['title'],
                      onTab: () {
                        final page = option['page'];
                        if (page != null) {
                          Get.to(page());
                        } else {
                          appBottomSheet(
                            context: context,
                            text1: 'Log Out',
                            text2: 'Are you sure you want to log out',
                            onPressed: () async {
                              Get.delete<ClientBottomNavController>();
                              await locator<BaseCache>()
                                  .deleteCache(key: CacheConstant.tokenKey);
                              Get.to(const LogInPage());
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
