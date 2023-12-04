import 'package:flutter/material.dart';
import 'package:receitas/components.dart/meal_item.dart';
import 'package:receitas/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('Nenhuma refeição foi marcada como favorita'),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (context, index) {
              return MealItem(favoriteMeals[index]);
            });
  }
}
