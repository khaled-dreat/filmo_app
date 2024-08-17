import 'package:filmo_app/models/genres/m_genre.dart';
import 'package:filmo_app/models/search/m_search_list.dart';
import 'package:filmo_app/view/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';

import '../api/api_end_point.dart';
import '../models/now_playing/m_now_playing.dart';
import '../models/popular_movies/m_popular_movies.dart';

class ControllerApi extends ChangeNotifier {
  ApiEndPoint apiEndPoint = ApiEndPoint();
// * Loading
  bool homeLoading = false;

  ///  change value loading
  set changeHomeLoading(bool value) {
    homeLoading = value;
    notifyListeners();
  }

  bool loadingGenres = false;

  set changeGenresLoading(bool value) {
    loadingGenres = value;
    notifyListeners();
  }

  bool loading = false;

  set changeLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  // ******************** initRequest *********************
  void initRequest() {
    getNowPlayingMovies();
    getPopularMovies();
  }

  List<NowPlayingModel> nowPlayingMovies = [];

  Future<void> getNowPlayingMovies() async {
    changeHomeLoading = true;
    var result = await apiEndPoint.getNowPlayingList();
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (movies) {
        nowPlayingMovies = movies.results!.sublist(0, 6);
      },
    );

    changeHomeLoading = false;
    notifyListeners();
  }

  List<PopularMoviesModel> popularMovies = [];

  Future<void> getPopularMovies() async {
    changeHomeLoading = true;
    var result = await apiEndPoint.getPopularMoviesList();
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (movies) {
        popularMovies = movies.results!.sublist(0, 10);
      },
    );

    changeHomeLoading = false;
    notifyListeners();
  }

  List<GenreModel> genres = [];

  Future<void> getGenresList() async {
    changeGenresLoading = true;
    var result = await apiEndPoint.getGenresList();
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (genresList) {
        genres = genresList.genres!;
      },
    );

    changeGenresLoading = false;
    notifyListeners();
  }

  bool isSearching = false;

  set changeIsSearching(bool value) {
    isSearching = value;
    notifyListeners();
  }

  SearchListModel? searchModel;
  Future<void> getSearchResult({required String srhText}) async {
    changeLoading = true;
    var result = await apiEndPoint.search(srhText: srhText);
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (result) {
        searchModel = result;
      },
    );

    changeLoading = false;
    changeIsSearching = true;
    notifyListeners();
  }
}
