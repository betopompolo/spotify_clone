import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_clone/src/authentication/login_form.widget.dart';

final loginProvider = FutureProvider.family<bool, LoginFormInput>(
  (ref, input) async {
    if (input.email.isEmpty || input.password.isEmpty) {
      throw ArgumentError.value(input);
    }

    await Future.delayed(const Duration(seconds: 1));
    return true;
  },
);
