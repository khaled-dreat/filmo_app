import 'package:dartz/dartz.dart';
import 'package:filmo_app/models/now_playing/m_now_playing_list.dart';

import '../models/popular_movies/m_popular_movies_list.dart';
import '../utils/failure/app_failure.dart';

abstract class ApiHandle {
  // * get list app type social
  Future<Either<Failure, NowPlayingListModel>> nowPlaying();
  Future<Either<Failure, PopularMoviesListModel>> popularMovies();
}
