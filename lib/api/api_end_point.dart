import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:filmo_app/api/api_handle.dart';
import 'package:filmo_app/api/app_api_key.dart';
import 'package:filmo_app/models/genres/m_genres_list.dart';
import 'package:filmo_app/models/popular_movies/m_popular_movies_list.dart';
import 'package:filmo_app/utils/failure/app_failure.dart';
import 'package:http/http.dart' as http;

import '../models/now_playing/m_now_playing_list.dart';

class ApiEndPoint extends ApiHandle {
  @override
  Future<Either<Failure, NowPlayingListModel>> getNowPlayingList() async {
    final headers = {
      'Authorization': AppApiKey.readAccessToken,
      'accept': 'application/json',
    };
    final uri = Uri.parse(AppApiKey.urlBuilder(value: AppApiKey.nowPlaying));
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      //   log(data.toString());
      return Right(NowPlayingListModel.fromJson(data));
    } else {
      return Left(ServerFailure.fromHttpException(response));
    }
  }

  @override
  Future<Either<Failure, PopularMoviesListModel>> getPopularMoviesList() async {
    final headers = {
      'Authorization': AppApiKey.readAccessToken,
      'accept': 'application/json',
    };
    final uri = Uri.parse(AppApiKey.urlBuilder(value: AppApiKey.popular));
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data.toString());
      return Right(PopularMoviesListModel.fromJson(data));
    } else {
      return Left(ServerFailure.fromHttpException(response));
    }
  }

  @override
  Future<Either<Failure, GenresListModel>> getGenresList() async {
    final headers = {
      'Authorization': AppApiKey.readAccessToken,
      'accept': 'application/json',
    };
    final uri = Uri.parse(AppApiKey.urlBuilder(value: AppApiKey.genre));
    final response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data.toString());
      return Right(GenresListModel.fromJson(data));
    } else {
      return Left(ServerFailure.fromHttpException(response));
    }
  }
}
