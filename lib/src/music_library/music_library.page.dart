import 'package:flutter/material.dart';
import 'package:spotify_clone/src/authentication/login_form.widget.dart';

class MusicLibraryPage extends StatelessWidget {
  const MusicLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(
        onSubmit: (input) {
          print('loggedIn!');
        },
      ),
    );
  }
}
