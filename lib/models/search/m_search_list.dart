import 'm_search.dart';

class SearchListModel {
  int? page;
  List<SearchModel>? results;
  int? totalPages;
  int? totalResults;

  SearchListModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchListModel.fromJson(Map<String, dynamic> json) {
    return SearchListModel(
      page: json['page'],
      results: json['results'] != null
          ? List<SearchModel>.from(
              json['results'].map((x) => SearchModel.fromJson(x)))
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results != null
          ? List<dynamic>.from(results!.map((x) => x.toJson()))
          : null,
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
