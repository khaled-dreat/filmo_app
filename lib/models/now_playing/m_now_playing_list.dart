import 'dates.dart';
import 'm_now_playing.dart';

class NowPlayingListModel {
  Dates? dates;
  int? page;
  List<NowPlayingModel>? results;

  NowPlayingListModel({this.dates, this.page, this.results});

  factory NowPlayingListModel.fromJson(Map<String, dynamic> json) =>
      NowPlayingListModel(
        dates: json['dates'] == null
            ? null
            : Dates.fromJson(json['dates'] as Map<String, dynamic>),
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => NowPlayingModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'dates': dates?.toJson(),
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
      };
}
