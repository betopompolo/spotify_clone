import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/home/home_location.dart';
import 'package:spotify_clone/src/navigation/active_bottom_tab_provider.dart';
import 'package:spotify_clone/src/navigation/bottom_tab.dart';
import 'package:spotify_clone/src/search/search_location.dart';

class BottomTabNavigationPage extends ConsumerWidget {
  const BottomTabNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(activeBottomTabProvider),
        children: routerDelegates
            .map((routerDelegate) => Beamer(routerDelegate: routerDelegate))
            .toList(),
      ),
      bottomNavigationBar: const BottomTab(),
      extendBody: true,
    );
  }
}

final routerDelegates = [
  BeamerDelegate(
    initialPath: '/home',
    locationBuilder: (state) {
      if (state.pathBlueprintSegments.contains('home')) {
        return HomeLocation();
      }
      return NotFound(path: state.pathBlueprintSegments.toString());
    },
  ),
  BeamerDelegate(
    initialPath: '/search',
    locationBuilder: (state) {
      if (state.pathBlueprintSegments.contains('search')) {
        return SearchLocation();
      }
      return NotFound(path: state.pathBlueprintSegments.toString());
    },
  ),
];
