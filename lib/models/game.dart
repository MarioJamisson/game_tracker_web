class Game {
  final String title;
  final String description;
  final String imageUrl;
  final String completedDate;

  Game({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.completedDate,
  });

  // Converte o objeto Game em um Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'completedDate': completedDate,
    };
  }

  // Constrói um objeto Game a partir de um Map
  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      completedDate: map['completedDate'],
    );
  }
}
