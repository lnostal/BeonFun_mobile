import 'package:flutter/material.dart';
import 'package:flutter_beonfun/ui/post_body.dart';
import 'package:flutter_beonfun/ui/post_footer_view.dart';
import 'package:flutter_beonfun/ui/post_header_view.dart';

class FeedListView extends StatefulWidget {
  const FeedListView({super.key});

  /// Consists of:
  /// - user info - PostHeaderView:
  ///   - avatar placeholder
  ///   - name placeholder
  ///   - motto or group placeholder
  /// -------------
  /// - post info:
  ///   - caption placeholder
  ///   - rich text placeholder
  ///   - more button (if needed)
  ///   - likes
  ///   - reposts
  ///   - comments

  @override
  State<FeedListView> createState() => _FeedListViewState();
}

class _FeedListViewState extends State<FeedListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [PostHeaderView(), PostBody(), PostFooterView()],
    ));
  }
}
