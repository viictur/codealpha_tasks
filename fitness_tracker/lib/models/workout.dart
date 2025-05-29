class Workout {
  final String type;
  final int duration; // in minutes
  final DateTime date;
  final String? notes;

  Workout({
    required this.type,
    required this.duration,
    required this.date,
    this.notes,
  });
}
