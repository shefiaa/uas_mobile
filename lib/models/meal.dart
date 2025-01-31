// lib/models/meal.dart
class Meal {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final String mealTime; // breakfast, lunch, dinner, snack

  Meal({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.mealTime,
  });
}