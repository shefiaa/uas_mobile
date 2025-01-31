import '../models/workout.dart';
import '../models/meal.dart';
import '../models/daily_stats.dart';

class AppConstants {
  static final List<Workout> dailyWorkouts = [
    Workout(
      name: 'Push Up',
      description: '3 set x 10 repetisi',
      duration: 10,
      caloriesBurn: 100,
      imageUrl: 'assets/images/pushup.png',
    ),
    Workout(
      name: 'Squat',
      description: '3 set x 12 repetisi',
      duration: 15,
      caloriesBurn: 150,
      imageUrl: 'assets/images/squat.png',
    ),
    Workout(
      name: 'Plank',
      description: '3 set x 30 detik',
      duration: 8,
      caloriesBurn: 80,
      imageUrl: 'assets/images/plank.png',
    ),
    Workout(
      name: 'Jumping Jack',
      description: '3 set x 20 repetisi',
      duration: 12,
      caloriesBurn: 120,
      imageUrl: 'assets/images/jumping.png',
    ),
  ];

  static final List<Meal> sampleMeals = [
    Meal(
      name: 'Oatmeal dengan Pisang',
      calories: 300,
      protein: 8,
      carbs: 50,
      fat: 6,
      mealTime: 'breakfast',
    ),
    Meal(
      name: 'Nasi dengan Ayam Panggang',
      calories: 450,
      protein: 35,
      carbs: 55,
      fat: 12,
      mealTime: 'lunch',
    ),
    Meal(
      name: 'Salad Sayur dengan Tuna',
      calories: 350,
      protein: 25,
      carbs: 20,
      fat: 15,
      mealTime: 'dinner',
    ),
  ];

  static const DailyStats defaultStats = DailyStats(
    targetCalories: 2000,
    consumedCalories: 0,
    burnedCalories: 0,
    waterIntake: 0,
    steps: 0,
  );
}
