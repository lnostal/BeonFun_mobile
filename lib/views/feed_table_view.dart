import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_beonfun/views/post_body.dart';
import 'package:flutter_beonfun/views/post_footer_view.dart';
import 'package:flutter_beonfun/views/post_header_view.dart';

class FeedTableView extends StatefulWidget {
  const FeedTableView({super.key});

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
  State<FeedTableView> createState() => _FeedTableViewState();
}

class _FeedTableViewState extends State<FeedTableView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeaderView(),
          PostBody(),
          PostFooterView()
        ],
      )
      );
  }
}

