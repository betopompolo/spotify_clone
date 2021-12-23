import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.headerLeadingIcon,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget? headerLeadingIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24.0, 0, 16.0),
      child: Row(
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
    );
  }
}
