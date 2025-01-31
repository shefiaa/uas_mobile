import 'package:flutter/material.dart';
import '../widgets/stats_card.dart';
import '../widgets/workout_card.dart';
import '../models/daily_stats.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Harian'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const StatsCard(stats: AppConstants.defaultStats),
          const SizedBox(height: 24),
          const Text(
            'Latihan Hari Ini',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppConstants.dailyWorkouts.length,
            itemBuilder: (context, index) {
              return WorkoutCard(
                workout: AppConstants.dailyWorkouts[index],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Makanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}