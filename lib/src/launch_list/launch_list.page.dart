import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/launch_list/launch_list.provider.dart';

class LaunchListPage extends ConsumerWidget {
  const LaunchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchListAsync = ref.watch(launchListProvider);

    return Scaffold(
      body: launchListAsync.when(
        data: (launchList) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    'Missions 🚀',
                    style: Theme.of(context).textTheme.headline5,
                  );
                }

                final launch = launchList[index - 1];
                return Text(launch.missionName ?? 'Unknown mission');
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemCount: launchList.length + 1,
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(child: Text('Something went wrong'));
        },
        loading: () {
          return const Center(child: Text('Loading...'));
        },
      ),
    );
  }
}
