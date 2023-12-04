import 'package:flutter/material.dart';
import 'package:receitas/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, void Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          color: theme.colorScheme.secondary,
          alignment: Alignment.bottomCenter,
          child: Text(
            'Vamos Cozinhar?',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: theme.colorScheme.primary),
          ),
        ),
        const SizedBox(height: 20),
        _createItem(Icons.restaurant, 'Refeições', () => Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
        _createItem(
            Icons.settings, 'Configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings))
      ]),
    );
  }
}
