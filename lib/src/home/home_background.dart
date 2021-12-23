import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 0.3],
        ),
      ),
    );
  }
}
