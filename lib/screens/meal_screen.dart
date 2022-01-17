import 'package:flutter/material.dart';
import 'package:meals_flutter/models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
