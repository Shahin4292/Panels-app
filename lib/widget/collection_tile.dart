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
          Positioned.fill(
            left: 25,
            right: 25,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black87,
                //     blurRadius: 6,
                //     spreadRadius: -6,
                //     offset: Offset(0, 10),
                //   )
                // ],
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/500/500?random=imag_1$index',
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 15,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 6,
                    spreadRadius: -6,
                    offset: Offset(0, 10),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/500/500?random=imag_2$index',
                  fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
              bottom: 30,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 6,
                      spreadRadius: -6,
                      offset: Offset(0, 10),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/500/500?random=imag_3$index',
                  fit: BoxFit.cover,
                ),
              )),
          Positioned(
            bottom: 35,
              right: 5,
              child: Icon(Icons.star,color: Colors.white,))
        ],
      ),
    );
  }
}
