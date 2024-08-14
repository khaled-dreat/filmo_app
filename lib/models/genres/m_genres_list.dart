import 'm_genre.dart';

class GenresListModel {
  List<GenreModel>? genres;

  GenresListModel({this.genres});

  factory GenresListModel.fromJson(Map<String, dynamic> json) =>
      GenresListModel(
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'genres': genres?.map((e) => e.toJson()).toList(),
      };
}
