import 'package:flutter/material.dart';

import '../models/post.dart';
import 'loader_view.dart';
import 'post_list_cell_view.dart';

class PostsListView extends StatefulWidget {
  final bool showUserInfo;
  final List<Post>? posts;
  final Future<void> Function() onPullRefresh;

  const PostsListView({
    Key? key,
    required this.showUserInfo,
    required this.posts,
    required this.onPullRefresh,
  }) : super(key: key);

  @override
  State<PostsListView> createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  @override
  Widget build(BuildContext context) {
    if (widget.posts == null) {
      return const Loader();
    } else if (widget.posts!.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Image.asset('assets/images/void.jpeg')],
      );
    }

    return RefreshIndicator(
        onRefresh: widget.onPullRefresh,
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: widget.posts!.length,
            itemBuilder: (context, index) {
              return PostListCellView(
                showUserInfo: widget.showUserInfo,
                post: widget.posts![index],
              );
            }));
  }
}
