import 'package:flutter/material.dart';
import '../models/workout.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() =>
      _AddWorkoutScreenState();
}

class _AddWorkoutScreenState
    extends State<AddWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _durationController =
      TextEditingController();
  final TextEditingController _notesController =
      TextEditingController();

  String _selectedType = 'Cardio';
  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Workout(
        type: _selectedType,
        duration: int.parse(_durationController.text),
        date: _selectedDate,
        notes: _notesController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Workout saved successfully!'),
        ),
      );

      Navigator.pop(context);
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedType,
                items:
                    [
                          'Cardio',
                          'Strength',
                          'Yoga',
                          'Calisthenics',
                          'Other',
                        ]
                        .map(
                          (type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ),
                        )
                        .toList(),
                onChanged:
                    (value) => setState(
                      () => _selectedType = value!,
                    ),
                decoration: InputDecoration(
                  labelText: 'Workout Type',
                ),
              ),
              TextFormField(
                controller: _durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Duration (minutes)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter duration';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  labelText: 'Notes',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: ${_selectedDate.toLocal().toString().split(' ')[0]}',
                  ),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
