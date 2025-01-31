// lib/models/workout.dart
class Workout {
  final String name;
  final String description;
  final int duration; // in minutes
  final int caloriesBurn;
  final String imageUrl;

  Workout({
    required this.name,
    required this.description,
    required this.duration,
    required this.caloriesBurn,
    required this.imageUrl,
  });
}