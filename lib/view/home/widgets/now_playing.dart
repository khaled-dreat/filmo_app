import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/c_api.dart';
import 'custom_now_playing_card.dart';
import 'scroll_widget.dart';

class FeaturedNowPlayingListView extends StatefulWidget {
  const FeaturedNowPlayingListView({super.key});

  @override
  State<StatefulWidget> createState() => _FeaturedNowPlayingListViewState();
}

class _FeaturedNowPlayingListViewState
    extends State<FeaturedNowPlayingListView> {
  late final ScrollController _scrollController;
  var currentIndex = 0; // Track the current index

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Update current index based on the scroll position
    int newIndex = (_scrollController.position.pixels /
            MediaQuery.of(context).size.width *
            1.3)
        .round();
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ControllerApi cApi = Provider.of<ControllerApi>(context);

    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: cApi.nowPlayingMovies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * .8,
                margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomNowPlayingCard(
                  results: cApi.nowPlayingMovies.elementAt(index),
                ),
              );
            },
          ),
          ScrollWidget(
            currentIndex: currentIndex,
            length: cApi.nowPlayingMovies.length,
          )
        ],
      ),
    );
  }
}
