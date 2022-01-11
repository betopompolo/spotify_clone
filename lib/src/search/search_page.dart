import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/battery/battery_level.provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int? _batteryLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_batteryLevel != null)
              Text('Battery level: $_batteryLevel %')
            else
              const Text('No battery level info available'),
            const SizedBox.square(dimension: 16),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () async {
                    final level = await ref.read(batteryLevelProvider.future);
                    setState(() {
                      _batteryLevel = level;
                    });
                  },
                  child: const Text('Update battery level'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
