import 'package:flutter/material.dart';
import 'package:flutter_beonfun/views/post_body.dart';
import 'package:flutter_beonfun/views/post_footer_view.dart';

/// Consists of:
  /// - post info:
  ///   - caption placeholder
  ///   - rich text placeholder
  ///   - more button (if needed)
  ///   - likes
  ///   - reposts
  ///   - comments
  
  class DiaryListView extends StatefulWidget {
  const DiaryListView({super.key});

  @override
  State<DiaryListView> createState() => _DiaryListViewState();
}

class _DiaryListViewState extends State<DiaryListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          PostBody(),
          PostFooterView()
        ],
      )
    );
  }
}