import 'package:flutter/material.dart';
import 'package:receitas/components.dart/main_drawer.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/views/categories_screen.dart';
import 'package:receitas/views/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {super.key});

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
      {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens![_selectedScreenIndex]['title'] as String)),
      body: _screens![_selectedScreenIndex]['screen'] as Widget,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        ],
      ),
    );
  }
}
