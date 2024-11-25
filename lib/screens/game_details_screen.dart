import 'package:flutter/material.dart';
import '../models/game.dart';

class GameDetailsScreen extends StatelessWidget {
  final Game game; // O parâmetro que será passado

  // Recebe o parâmetro `game` no construtor
  const GameDetailsScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(game.imageUrl),
            const SizedBox(height: 16),
            Text(
              game.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Zerado em: ${game.completedDate}'),
            const SizedBox(height: 8),
            Text(game.description),
          ],
        ),
      ),
    );
  }
}
