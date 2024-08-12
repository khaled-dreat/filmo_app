import 'package:filmo_app/models/now_playing/m_now_playing_list.dart';
import 'package:filmo_app/view/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';

import '../api/api_end_point.dart';
import '../models/now_playing/m_now_playing.dart';
import '../models/popular_movies/m_popular_movies.dart';

class ControllerApi extends ChangeNotifier {
  bool loading = false;
  ApiEndPoint apiEndPoint = ApiEndPoint();

  ///  change value loading
  set changeLoadingNowPlaying(bool value) {
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
    changeLoadingNowPlaying = true;
    var result = await apiEndPoint.nowPlaying();
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (movies) {
        nowPlayingMovies = movies.results!.sublist(0, 6);
      },
    );

    changeLoadingNowPlaying = false;
    notifyListeners();
  }

  List<PopularMoviesModel> popularMovies = [];

  Future<void> getPopularMovies() async {
    changeLoadingNowPlaying = true;
    var result = await apiEndPoint.popularMovies();
    result.fold(
      (failure) {
        AppToast.toast(failure.message);
      },
      (movies) {
        popularMovies = movies.results!.sublist(0, 10);
      },
    );

    changeLoadingNowPlaying = false;
    notifyListeners();
  }
}
