import 'package:flutter/material.dart';
import 'package:spotify_clone/src/common/models.dart';

class WrappedView extends StatelessWidget {
  final Wrapped wrapped;

  const WrappedView({
    Key? key,
    required this.wrapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              wrapped.coverUrl,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            wrapped.text,
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(fontSize: 14.0, height: 1.4),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
