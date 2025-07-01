import 'package:coaching_app/features/client_dashboard/presentation/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class ReardeltoidWorkout extends StatelessWidget {
  const ReardeltoidWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Center(
          child: Text(
            'Rear Deltoid',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: const [
            SizedBox(
              height: 15,
            ),
            WorkoutOption(
              workout: 'Cable Cross Reverse Fly',
              workoutUrl:
                  'https://youtube.com/shorts/bkejPHrPkmA?si=V7pgZgnFGLHPKX3k',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Machine Reverse Fly',
              workoutUrl:
                  'https://youtube.com/shorts/P5CXx_jgTDE?si=inL3eHuCJA_DS7UY',
            ),
          ],
        ),
      ),
    );
  }
}
