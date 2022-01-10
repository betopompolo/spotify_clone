import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/home/home_page.dart';
import 'package:spotify_clone/src/music_library/music_library.page.dart';
import 'package:spotify_clone/src/navigation/active_bottom_tab_provider.dart';
import 'package:spotify_clone/src/navigation/bottom_tab.dart';
import 'package:spotify_clone/src/search/search_page.dart';

class BottomTabNavigationPage extends ConsumerWidget {
  const BottomTabNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(activeBottomTabProvider),
        children: _tabPages.map((e) {
          return Navigator(
            pages: [MaterialPage(child: e)],
            onPopPage: (route, result) => route.didPop(result),
          );
        }).toList(),
      ),
      bottomNavigationBar: const BottomTab(),
    );
  }
}

final _tabPages = [
  const HomePage(),
  const SearchPage(),
  const MusicLibraryPage(),
];
