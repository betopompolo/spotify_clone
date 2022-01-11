import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/native/app_method_channels.dart';

final batteryLevelProvider = FutureProvider<int>((ref) async {
  final int batteryLevel =
      await const MethodChannel(AppMethodChannels.batteryLevel)
          .invokeMethod('getBatteryLevel');

  return batteryLevel;
});
