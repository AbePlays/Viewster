class ShowModel {
  final int id;
  final String title;
  final String imageUrl;
  final String votes;
  final String releaseDate;
  final String language;

  ShowModel(
      {this.id,
      this.title,
      this.imageUrl,
      this.votes,
      this.releaseDate,
      this.language});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageUrl': imageUrl,
        'votes': votes,
        'releaseDate': releaseDate,
        'language': language
      };
}
