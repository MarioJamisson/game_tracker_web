import 'package:flutter/material.dart';
import '../models/game.dart';

class AddGameScreen extends StatefulWidget {
  final Function(Game) onAddGame;

  const AddGameScreen({super.key, required this.onAddGame});

  @override
  _AddGameScreenState createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _imageUrl = '';
  String _completedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Jogo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Título do Jogo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título do jogo.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma descrição.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL da Imagem'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a URL da imagem.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imageUrl = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Data em que foi Zerado'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _completedDate = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      final newGame = Game(
                        title: _title,
                        description: _description,
                        imageUrl: _imageUrl,
                        completedDate: _completedDate,
                      );
                      widget.onAddGame(newGame);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
