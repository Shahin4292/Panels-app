import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final int index;
  final double extend;

  const CollectionTile({super.key, required this.index, required this.extend});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: extend,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=imag_1$index'),
          ),
          Positioned(
            bottom: 15,
            child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=imag_2$index'),
          ),
          Positioned(
            bottom: 30,
            child: CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=imag_3$index'),
          ),
        ],
      ),
    );
  }
}
