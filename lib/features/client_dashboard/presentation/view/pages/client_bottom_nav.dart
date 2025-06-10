// import 'package:coaching_app/core/theme/app_colors.dart';
// import 'package:coaching_app/features/client_dashboard/presentation/cubit/client_bottom_nav_cubit.dart';
// import 'package:coaching_app/features/client_dashboard/presentation/view/pages/client_home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ClientDashboard extends StatelessWidget {
//   const ClientDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ClientBottomNavCubit(),
//       child: BlocBuilder<ClientBottomNavCubit, ClientBottomNavigationBarState>(
//         builder: (context, state) {
//           ClientBottomNavCubit controller = context.read<ClientBottomNavCubit>();
//           return Scaffold(
//             bottomNavigationBar: BottomNavigationBar(
//               iconSize: 35,
//               backgroundColor: AppColors.white,
//               elevation: 0,
//               selectedItemColor: AppColors.primaryColor,
//               unselectedItemColor: AppColors.black,
//               currentIndex: controller.selectedTapIndex,
//               onTap: (index) {
//                 controller.onChangeTabIndex(index);
//               },
//               items: controller.bottomNavigationBarItems,
//               type: BottomNavigationBarType.fixed,
//             ),
//             body: PageView(
//               controller: controller.pageController,
//               onPageChanged: (index) {
//                 controller.onPageChanged(index);
//               },
//               children:  [
//                 ClientHomePage(),
//                 Center(child: Text('2')),
//                 Center(child: Text('3')),
//                 Center(child: Text('4')),
//                 Center(child: Text('5')),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
