import 'package:flutter/material.dart';
import 'package:meals_flutter/screens/meal_screen.dart';
import 'package:meals_flutter/screens/settings_screen.dart';
import 'package:meals_flutter/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './utils/app-routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(220, 220, 220, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w500,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.purpleAccent),
      ),
      routes: {
        AppRoutes.HOME: (context) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => const CategoryMeals(),
        AppRoutes.MEAL: (context) => const MealScreen(),
        AppRoutes.SETTINGS: (context) => const SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
