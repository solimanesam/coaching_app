// ignore_for_file: prefer_const_constructors

import 'package:coaching_app/core/theme/app_colors.dart';
import 'package:coaching_app/features/client_dashboard/presentation/muscle_workouts/arm_workouts/arm_workouts.dart';
import 'package:coaching_app/features/client_dashboard/presentation/muscle_workouts/back_workout.dart';
import 'package:coaching_app/features/client_dashboard/presentation/muscle_workouts/chest_workouts.dart';
import 'package:coaching_app/features/client_dashboard/presentation/muscle_workouts/legs_workouts/legs_workouts.dart';
import 'package:coaching_app/features/client_dashboard/presentation/muscle_workouts/shoulders_workouts/shoulders_workout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor:AppColors.white,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildWorkoutButton(context, 'Chest Workouts', ChestWorkouts()),
            buildWorkoutButton(context, 'Back Workouts', BackWorkout()),
            buildWorkoutButton(context, 'Arm Workouts', ArmWorkouts()),
            buildWorkoutButton(context, 'Shoulders Workouts', ShouldersWorkouts()),
            buildWorkoutButton(context, 'Legs Workouts', LegsWorkouts()),
          ],
        ),
      ),
    );
  }

  Widget buildWorkoutButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => navigateTo(context, page),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
