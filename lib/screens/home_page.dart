import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/cubits/cubits.dart';
import 'package:flutter_netflix_ui/data/data.dart';
import 'package:flutter_netflix_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("cast"),
        backgroundColor: Colors.grey[850],
        child: Icon(Icons.cast),
      ),
      appBar: PreferredSize(
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
        preferredSize: Size(size.width, 50),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          /// CustomScrollView只能包裹sliver的组件
          /// 如果要包裹普通组件就使用SliverToBoxAdapter
          SliverToBoxAdapter(
            child: ContentHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey("previews"),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey("My List"),
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey("Netflix Originals"),
              title: "Netflix Originals",
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey("Trending"),
                title: "Trending",
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
