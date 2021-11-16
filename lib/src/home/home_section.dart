import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? headerLeadingIcon;
  final Widget child;

  const HomeSection({
    Key? key,
    required this.child,
    required this.title,
    this.subtitle,
    this.headerLeadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaSize = MediaQuery.of(context).removeViewPadding().size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (headerLeadingIcon != null)
                Container(
                  height: 32,
                  width: 32,
                  margin: const EdgeInsets.only(right: 8.0),
                  child: headerLeadingIcon,
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                          wordSpacing: -2.0,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          LimitedBox(maxHeight: safeAreaSize.height * 0.6, child: child),
        ],
      ),
    );
  }
}
