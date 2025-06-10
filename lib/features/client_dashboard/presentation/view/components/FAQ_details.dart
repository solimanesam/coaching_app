// import 'package:coaching_app/features/client_dashboard/presentation/cubit/client_bottom_nav_cubit.dart';
// import 'package:coaching_app/features/client_dashboard/presentation/view/components/question_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FaqDetails extends StatelessWidget {
//   const FaqDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ClientBottomNavCubit(),
//       child: BlocBuilder<ClientBottomNavCubit, ClientBottomNavigationBarState>(
//         builder: (context, state) {
//           ClientBottomNavCubit cubit = context.read<ClientBottomNavCubit>();
//           return Column(
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 ...List.generate(
//                   cubit.questions.length,
//                   (index) {
//                     return questionContainer(
//                         answers: cubit.answers,
//                         index: index,
//                         questions: cubit.questions,
//                         context: context,
//                         selectedContainer: cubit.selectedContainer,
//                         onTap: () => cubit.pressedbutton(index),
//                         );
//                   },
//                 )
//               ],
//             );
          
//         },
//       ),
//     );
//   }
// }
