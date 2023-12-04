import 'package:flutter/material.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/models/settings.dart';
import 'package:receitas/utils/app_routes.dart';
import 'package:receitas/views/categories_meals_screen.dart';
import 'package:receitas/views/categories_screen.dart';
import 'package:receitas/views/meal_detail_screen.dart';
import 'package:receitas/views/settings_screen.dart';
import 'package:receitas/views/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        final filterVegan = settings.isVegan && !meal.isVegan;

        return !filterGluten && !filterLactose && !filterVegetarian && !filterVegan;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() => _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal));
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        primarySwatch: Colors.pink,
        colorScheme: theme.colorScheme.copyWith(primary: Colors.pink, secondary: Colors.amber),
        textTheme: theme.textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: MediaQuery.of(context).textScaler.scale(20),
          ),
        ),
      ),
      routes: {
        AppRoutes.home: (context) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.mealDetail: (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (context) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => const CategoriesScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
