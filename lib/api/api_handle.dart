import 'package:dartz/dartz.dart';
import 'package:filmo_app/models/genres/m_genres_list.dart';
import 'package:filmo_app/models/now_playing/m_now_playing_list.dart';

import '../models/popular_movies/m_popular_movies_list.dart';
import '../utils/failure/app_failure.dart';

abstract class ApiHandle {
  Future<Either<Failure, NowPlayingListModel>> getNowPlayingList();
  Future<Either<Failure, PopularMoviesListModel>> getPopularMoviesList();
  Future<Either<Failure, GenresListModel>> getGenresList();
}
