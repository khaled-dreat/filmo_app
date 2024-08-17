import 'package:flutter/material.dart';

import '../../../models/search/m_search_list.dart';
import 'custom_srh_movie_card.dart';

class CustomListViewSrhResult extends StatelessWidget {
  const CustomListViewSrhResult({
    super.key,
    required this.movies,
  });

  final SearchListModel movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: movies.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () async {
                //    await BlocProvider.of<BookDetailsCubit>(context)
                //        .fetchFeaturedBooksDetails(id: book.bookId);
                //    await BlocProvider.of<AlsoLikeBooksCubit>(context)
                //        .fetchAlsoLike(author: book.autherName);
                //    AppRoutes.go(context, BookDetailsView.nameRoute);
                //    log(name: "Auther Name", book.bookId);
              },
              child:
                  CustomSrhBooksCard(movie: movies.results!.elementAt(index)),
            ));
      },
    );
  }
}
