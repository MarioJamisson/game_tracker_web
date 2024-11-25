import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_game_screen.dart';
import 'screens/game_details_screen.dart';
import 'models/game.dart'; // Importando a classe Game

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Jogos Zerados',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16.0),
        ),
        colorScheme: const ColorScheme.light(
          secondary: Colors.amber,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add-game': (context) => AddGameScreen(
          onAddGame: (newGame) {
            Navigator.pop(context, newGame);
          },
        ),
        '/game-details': (context) {
          final game = ModalRoute.of(context)!.settings.arguments as Game; // Cast correto para Game
          return GameDetailsScreen(game: game);
        },
      },
    );
  }
}
