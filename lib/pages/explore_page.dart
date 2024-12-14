import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widget/image_tile.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  var _selectedSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        _selectedSlideIndex = value;
                      });
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://picsum.photos/500/500?random=slide_$index',
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [0.01, 1],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black, Colors.transparent]),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(5, (index) {
                            return Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == _selectedSlideIndex
                                      ? Colors.white
                                      : Colors.grey),
                            );
                          })))
                ],
              ),
            ),
          ),
          SliverAppBar(),
        ];
      },
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ImageTile(
            index: index,
            imageSource: 'https://picsum.photos/500/500?random=img_$index',
            extent: (index % 2) == 0 ? 300 : 150,
          );
        },
      ),
    ));
  }
}
