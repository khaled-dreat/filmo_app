import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:filmo_app/api/api_handle.dart';
import 'package:filmo_app/utils/failure/app_failure.dart';
import 'package:http/http.dart' as http;

import '../models/now/now/now_playing.dart';

class ApiEndPoint extends ApiHandle {
  @override
  Future<Either<Failure, NowPlayingModel>> NowPlayingFilmes() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyOWIxMGFkZWEzYzRhMTBlOGFiNDY0MmFmODNjZjViZSIsIm5iZiI6MTcyMzMxMjQ1NC44MjI2MjYsInN1YiI6IjY2YjFmNjVkM2RjNGJmZjEzYjc1NzE4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3HUyp5gul568LOrGgjf2f8_9JS4yuljJQoNkKfE4DNQ', // استبدل هذا بالتوكن الخاص بك
        'accept': 'application/json',
      },
    );

    //  final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      log(data.toString());
      return Right(NowPlayingModel.fromJson(data));
    } else {
      return Left(ServerFailure.fromHttpException(response));
    }
  }
}
