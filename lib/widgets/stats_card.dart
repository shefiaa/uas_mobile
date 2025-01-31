import 'package:flutter/material.dart';
import '../models/daily_stats.dart';

class StatsCard extends StatelessWidget {
  final DailyStats stats;

  const StatsCard({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCalorieStats(),
            const Divider(height: 32),
            _buildOtherStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalorieStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          'Target',
          '${stats.targetCalories}',
          'kkal',
          Colors.blue,
        ),
        _buildStatItem(
          'Konsumsi',
          '${stats.consumedCalories}',
          'kkal',
          Colors.orange,
        ),
        _buildStatItem(
          'Terbakar',
          '${stats.burnedCalories}',
          'kkal',
          Colors.green,
        ),
      ],
    );
  }

  Widget _buildOtherStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(
          'Air',
          '${stats.waterIntake}',
          'gelas',
          Colors.blue,
        ),
        _buildStatItem(
          'Langkah',
          '${stats.steps}',
          'langkah',
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    String unit,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
