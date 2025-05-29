// lib/screens/workout_history_screen.dart
import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutHistory extends StatelessWidget {
  WorkoutHistory({super.key});

  final List<Workout> workoutList = [
    Workout(
      type: 'Cardio',
      duration: 30,
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
      notes: 'Morning run in the estate.',
    ),
    Workout(
      type: 'Strength',
      duration: 45,
      date: DateTime.now().subtract(
        const Duration(days: 2),
      ),
      notes: 'Upper body workout.',
    ),
  ]; // Replace this with real data source in the future.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: workoutList.length,
        itemBuilder: (context, index) {
          final workout = workoutList[index];
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: ListTile(
              title: Text(
                '${workout.type} - ${workout.duration} mins',
              ),
              subtitle: Text(
                '${workout.date.toLocal().toString().split(' ')[0]}\n${workout.notes}',
              ),
            ),
          );
        },
      ),
    );
  }
}
