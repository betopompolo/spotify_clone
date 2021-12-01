import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class HomeLocation extends BeamLocation {
  HomeLocation() : super(BeamState.fromUriString('/home'));

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: const ValueKey('HomePage'),
        child: const HomePage(),
      ),
    ];
  }

  @override
  List get pathBlueprints => ['/home'];
}
