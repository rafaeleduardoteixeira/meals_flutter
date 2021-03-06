import 'package:flutter/material.dart';
import 'package:meals_flutter/components/meal_component.dart';
import 'package:meals_flutter/models/category.dart';
import 'package:meals_flutter/models/meal.dart';

class CategoryMeals extends StatelessWidget {
  final List<Meal> meals;

  const CategoryMeals(this.meals, [Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealComponent(categoryMeals[index]);
        },
      ),
    );
  }
}
