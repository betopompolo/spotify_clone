import 'package:artemis/artemis.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/graphql/graphql_schema.graphql.dart';

final launchListProvider = FutureProvider<List<LaunchList$Query$Launch>>(
  (ref) async {
    final client = ArtemisClient("https://api.spacex.land/graphql/");
    final result = await client.execute(LaunchListQuery(
      variables: LaunchListArguments(limit: 10),
    ));

    final launchList = result.data!.launchesPast!.map((e) => e!).toList();
    return launchList;
  },
);
