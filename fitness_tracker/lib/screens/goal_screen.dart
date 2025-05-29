import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final TextEditingController _weeklyGoalController =
      TextEditingController();
  String? savedGoal;

  void _saveGoal() {
    setState(() {
      savedGoal = _weeklyGoalController.text;
      _weeklyGoalController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Goal saved successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your weekly workout goal (e.g. 5 sessions, 150 minutes):',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _weeklyGoalController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weekly Goal',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveGoal,
              child: const Text('Save Goal'),
            ),
            SizedBox(height: 20),
            if (savedGoal != null)
              Text(
                'Your Current Goal:\n$savedGoal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
