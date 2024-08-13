import 'dates.dart';
import 'm_popular_movies.dart';

class PopularMoviesListModel {
  Dates? dates;
  int? page;
  List<PopularMoviesModel>? results;

  PopularMoviesListModel({this.dates, this.page, this.results});

  factory PopularMoviesListModel.fromJson(Map<String, dynamic> json) =>
      PopularMoviesListModel(
        dates: json['dates'] == null
            ? null
            : Dates.fromJson(json['dates'] as Map<String, dynamic>),
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => PopularMoviesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dates': dates?.toJson(),
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
