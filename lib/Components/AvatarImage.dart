import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class AvatarImage extends StatelessWidget {
  AvatarImage({
    required this.url,
    required this.radius,
  });

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2 * radius,
      width: 2 * radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: url.isEmpty
          ? Image.asset(
              'assets/images/user.png',
              fit: BoxFit.cover,
            )
          : CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
            ),
    );
  }
}
