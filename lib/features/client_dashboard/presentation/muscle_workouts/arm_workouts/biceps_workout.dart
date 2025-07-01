import 'package:coaching_app/features/client_dashboard/presentation/muscles_widgets/workout_option.dart';
import 'package:flutter/material.dart';

class BicepsWorkout extends StatelessWidget {
  const BicepsWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 31, 33),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 29, 31, 33),
        iconTheme: const IconThemeData(color: Colors.orange),
        title: const Text(
          'Biceps',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
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
              workout: 'Dumbbell Curls',
              workoutUrl:
                  'https://youtube.com/shorts/iui51E31sX8?si=w8ALC1jmppm1dRiM',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Dumbbell Concentration Curl',
              workoutUrl:
                  'https://youtube.com/shorts/cHxRJdSVIkA?si=_t0UJG0pUApJXFO7',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutOption(
              workout: 'Dumbbell hammer Curl',
              workoutUrl:
                  'https://youtube.com/shorts/jdYGDzCuGE4?si=Gg-CV0NX5L4xtCXx',
            ),
          ],
        ),
      ),
    );
  }
}
