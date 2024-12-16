import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pannels/widget/collection_tile.dart';

import '../widget/image_tile.dart';

const double kImageSliderHeight = 320;

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  var _selectedSlideIndex = 0;
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible &&
            _scrollController.position.pixels >= kImageSliderHeight) {
          setState(() {
            _isVisible = false;
          });
          // widget.afterScrollResult(_isVisible);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
          // widget.afterScrollResult(_isVisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _isVisible ? Colors.black : Colors.white,
        body: SafeArea(
          top: !_isVisible,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: kImageSliderHeight,
                  backgroundColor: Colors.black,
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
                                        colors: [
                                          Colors.black,
                                          Colors.transparent
                                        ]),
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
                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
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
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: SliverAppBar(
                    centerTitle: true,
                    floating: true,
                    snap: true,
                    backgroundColor: _isVisible
                        ? Colors.white
                        : Colors.white.withOpacity(0.95),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12))),
                    title: TextButton.icon(
                      onPressed: () {},
                      label: Text('Search'),
                      icon: Icon(Icons.search),
                      style: ButtonStyle(
                        foregroundColor: WidgetStatePropertyAll(Colors.black),
                        iconSize: WidgetStatePropertyAll(24),
                        textStyle:
                            WidgetStatePropertyAll(TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              color: Colors.white,
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return (index % 2) == 0
                      ? ImageTile(
                          index: index,
                          imageSource:
                              'https://picsum.photos/500/500?random=img_$index',
                          extent: 300,
                        )
                      : CollectionTile(index: index, extend: 150);
                },
              ),
            ),
          ),
        ));
  }
}
