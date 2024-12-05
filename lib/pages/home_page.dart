import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pannels/widget/image_tile.dart';

class HomePage extends StatefulWidget {
  final Function(bool) afterScrollResult;

  const HomePage({super.key, required this.afterScrollResult});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          widget.afterScrollResult(_isVisible);
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          widget.afterScrollResult(_isVisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                title: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Suggested",
                    ),
                    Tab(
                      text: "Liked",
                    ),
                    Tab(
                      text: "Library",
                    ),
                  ],
                  indicatorColor: Colors.red,
                  indicatorWeight: 4,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return ImageTile(
                    index: index,
                    imageSource: 'https://picsum.photos/500/500?random=$index',
                    extent: (index % 2) == 0 ? 300 : 150,
                  );
                },
              ),
              SizedBox(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
