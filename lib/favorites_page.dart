import 'package:flutter/material.dart';
import 'main.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.red;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites Page'),
        backgroundColor: Colors.green,        
      ),
      // drawer: const NavigationDrawer(),
    );
  }
}
