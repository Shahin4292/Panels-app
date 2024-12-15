import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile(
      {super.key,
      required this.imageSource,
      required this.index,
      required this.extent});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageDetails(context imageSource);
      },
      child: Container(
          height: extent,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageSource,
                fit: BoxFit.cover,
              ),
              // Image.network(
              //   imageSource,
              //   fit: BoxFit.cover,
              // ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black.withOpacity(0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Art $index',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,size: 20,
                          ),
                        ),
                      ],
                    )),
              ),
              Column(

                children: [

              ],)
            ],
          )),
    );
  }

  void showImageDetails(BuildContext context, String imageSource) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context){
      return FractionallySizedBox(

        heightFactor: 0.9,
      );
    });
  }
}
