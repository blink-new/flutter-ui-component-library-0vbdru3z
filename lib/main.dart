import 'package:flutter/material.dart';
import 'screens/foodie_queue_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const FoodieQueueApp());
}

class FoodieQueueApp extends StatelessWidget {
  const FoodieQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie Queue',
      theme: AppTheme.lightTheme,
      home: const FoodieQueueScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}