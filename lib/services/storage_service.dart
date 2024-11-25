import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/game.dart';

class StorageService {
  static const String _key = 'games_list';

  // Método para salvar a lista de jogos no shared_preferences
  static Future<void> saveGames(List<Game> games) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> gamesJson = games.map((game) => json.encode(game.toMap())).toList();
    await prefs.setStringList(_key, gamesJson);
  }

  // Método para carregar a lista de jogos
  static Future<List<Game>> loadGames() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? gamesJson = prefs.getStringList(_key);
    if (gamesJson == null) {
      return [];
    } else {
      return gamesJson
          .map((gameString) => Game.fromMap(json.decode(gameString)))
          .toList();
    }
  }
}
