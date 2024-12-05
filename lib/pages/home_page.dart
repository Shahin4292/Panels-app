import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pannels/widget/image_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
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
          body: MasonryGridView.count(
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
        ),
      ),
    );
  }
}
