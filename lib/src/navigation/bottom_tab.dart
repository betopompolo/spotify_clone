import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/navigation/active_bottom_tab_provider.dart';

class BottomTab extends ConsumerWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: ref.watch(activeBottomTabProvider),
        onTap: (index) {
          ref.read(activeBottomTabProvider.notifier).state = index;
        },
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Your library",
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.library_music_outlined),
            activeIcon: Icon(Icons.library_music),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
