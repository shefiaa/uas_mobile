// lib/screens/food_screen.dart
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../utils/constants.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // TODO: Implement date picker
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCaloriesSummary(),
            _buildMealTimeSection('Sarapan', AppConstants.sampleMeals.where((meal) => meal.mealTime == 'breakfast').toList()),
            _buildMealTimeSection('Makan Siang', AppConstants.sampleMeals.where((meal) => meal.mealTime == 'lunch').toList()),
            _buildMealTimeSection('Makan Malam', AppConstants.sampleMeals.where((meal) => meal.mealTime == 'dinner').toList()),
            _buildMealTimeSection('Camilan', AppConstants.sampleMeals.where((meal) => meal.mealTime == 'snack').toList()),
            const SizedBox(height: 80), // Space for FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement add meal
        },
        icon: const Icon(Icons.add),
        label: const Text('Tambah Makanan'),
      ),
    );
  }

  Widget _buildCaloriesSummary() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade400, Colors.blue.shade600],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Total Kalori Hari Ini',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '850 / 2000 kkal',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNutrientProgress('Protein', 0.6, '45/75g'),
              _buildNutrientProgress('Karbo', 0.4, '120/300g'),
              _buildNutrientProgress('Lemak', 0.3, '20/65g'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientProgress(String label, double progress, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 60,
          height: 60,
          child: CircularProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 8,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMealTimeSection(String title, List<Meal> meals) {
    if (meals.isEmpty) return Container();
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // TODO: Add meal for specific time
                },
                icon: const Icon(Icons.add, size: 20),
                label: const Text('Tambah'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...meals.map((meal) => _buildMealCard(meal)).toList(),
        ],
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          meal.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Protein: ${meal.protein}g • Karbo: ${meal.carbs}g • Lemak: ${meal.fat}g',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${meal.calories} kkal',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
