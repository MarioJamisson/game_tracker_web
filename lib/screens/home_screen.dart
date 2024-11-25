import 'package:flutter/material.dart';
import 'game_details_screen.dart';
import '../models/game.dart';
import '../services/storage_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Game> games = [];

  @override
  void initState() {
    super.initState();
    _loadGames();
  }

  // Carregar os jogos ao iniciar o app
  _loadGames() async {
    List<Game> loadedGames = await StorageService.loadGames();
    setState(() {
      games = loadedGames;
    });
  }

  // Salvar os jogos sempre que a lista mudar
  _saveGames() async {
    await StorageService.saveGames(games);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Jogos Zerados'),
      ),
      body: games.isEmpty
          ? Center(
              child: Text('Nenhum jogo adicionado ainda.'),
            )
          : ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            game.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                game.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Zerado em: ${game.completedDate}',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              SizedBox(height: 4),
                              Text(
                                game.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              ElevatedButton(
                                onPressed: () {
                                  // Passando o game como argumento para a tela de detalhes
                                  Navigator.pushNamed(
                                    context,
                                    '/game-details',
                                    arguments: game, // O jogo é passado corretamente como argumento
                                  );
                                },
                                child: Text('Ver Detalhes'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newGame = await Navigator.pushNamed(
            context,
            '/add-game',
          );

          if (newGame != null) {
            setState(() {
              games.add(newGame as Game); // Garantir que newGame é do tipo Game
            });
            _saveGames(); // Salva os jogos no armazenamento local
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
