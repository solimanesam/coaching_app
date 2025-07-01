// import 'package:flutter/material.dart';

// class OnboardingPage extends StatelessWidget {
//   const OnboardingPage({super.key});

//   void _onIntroEnd(context) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('onboardingSeen', true);
//     Navigator.pushReplacementNamed(context, '/login'); // غيّر المسار حسب اسم صفحة تسجيل الدخول عندك
//   }

//   PageViewModel _buildPage({
//     required String title,
//     required String body,
//     required String imagePath,
//   // }) {؟
//     return PageViewModel(
//       title: title,
//       body: body,
//       image: Center(child: Image.asset(imagePath, height: 250)),
//       decoration: const PageDecoration(
//         titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         bodyTextStyle: TextStyle(fontSize: 16),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       pages: [
//         _buildPage(
//           title: "احصل على تدريب مخصص يناسبك",
//           body: "مدربين محترفين يصمموا لك خطة تمرين وغذاء مناسبة لهدفك.",
//           imagePath: "assets/images/trainer.png",
//         ),
//         _buildPage(
//           title: "تابع تقدمك لحظة بلحظة",
//           body: "سجل تمارينك، وسعراتك، وشوف نتائجك بتتحسن مع الوقت.",
//           imagePath: "assets/images/progress.png",
//         ),
//         _buildPage(
//           title: "تواصل مباشر مع مدربك",
//           body: "اسأل واطلب أي تعديل من مدربك في أي وقت عبر الشات.",
//           imagePath: "assets/images/chat.png",
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       onSkip: () => _onIntroEnd(context),
//       showSkipButton: true,
//       skip: const Text("تخطي"),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text("ابدأ", style: TextStyle(fontWeight: FontWeight.bold)),
//       dotsDecorator: DotsDecorator(
//         activeColor: Theme.of(context).primaryColor,
//         size: const Size(10.0, 10.0),
//         color: Colors.grey,
//         activeSize: const Size(22.0, 10.0),
//         activeShape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
//       ),
//     );
//   }
// }
