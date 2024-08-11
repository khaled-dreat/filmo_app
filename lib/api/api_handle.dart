import 'package:dartz/dartz.dart';
import 'package:filmo_app/models/now/now/now_playing.dart';

import '../utils/failure/app_failure.dart';

abstract class ApiHandle {
  // * get list app type social
  Future<Either<Failure, NowPlayingModel>> NowPlayingFilmes();
}
