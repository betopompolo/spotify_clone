import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/src/search/search_page.dart';

class SearchLocation extends BeamLocation {
  SearchLocation() : super(BeamState.fromUriString('/search'));

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final musicId = state.pathParameters['musicId'];

    return [
      BeamPage(
        child: const SearchPage(),
      ),
    ];
  }

  @override
  List get pathBlueprints => ['/search/:musicId'];
}
