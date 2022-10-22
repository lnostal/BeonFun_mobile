import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beonfun/models/comment.dart';
import 'package:flutter_beonfun/net/general_network.dart';
import 'package:flutter_beonfun/widgets/comment_view.dart';
import 'package:flutter_beonfun/widgets/send_message_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/blog.dart';
import '../../models/post.dart';
import '../../utils/utils.dart';
import '../../widgets/expanded_post/post_expanded.dart';
import '../../widgets/loader_view.dart';

class PostExpandedPage extends StatefulWidget {
  final PostType type;
  final String blname;
  final String id;

  const PostExpandedPage(
      {super.key, required this.type, required this.blname, required this.id});

  @override
  State<PostExpandedPage> createState() => _PostExpandedPageState();
}

class _PostExpandedPageState extends State<PostExpandedPage> {
  var _pushedNewComment = false;
  var _canComment = false;
  late Timer timer;
  AudioPlayer player = AudioPlayer();

  Map postInfo = {'comments': List};
  final textEditingController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    loadData();

    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      checkUpdates();
    });
  }

  @override
  void dispose() {
    print("Back To old Screen");
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_pushedNewComment) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(setPageTitle(postInfo)),
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            leading: CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.of(context).pop(),
            )),
        child: SafeArea(
            child: SendMessageBottomView(
          childWidget: createView(postInfo),
          controller: textEditingController,
          onSend: _sendComment,
          onAttach: _attachImages,
          enabled: _canComment,
        )));
  }

  String setPageTitle(Map postInfo) {
    if (postInfo['blog'] == null && postInfo['post'] == null) {
      return '';
    }

    if (widget.type == PostType.forum) {
      return (postInfo['post'] as Post).forum!.title;
    }

    return (postInfo['blog'] as Blog).title;
  }

  Widget createView(Map postInfo) {
    if (postInfo['post'] == null) {
      return const Loader();
    }

    int cellsCount = 1;

    if (postInfo['comments'] != null) {
      cellsCount = (postInfo['comments'] as List).length + 1;
    }

    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            controller: scrollController,
            itemCount: cellsCount,
            itemBuilder: (context, index) {
              if (index == 0) {
                return PostExpanded(post: postInfo['post']);
              }

              Comment comm = postInfo['comments'][index - 1] as Comment;

              return CommentView(
                user: comm.userInfo,
                text: comm.text,
              );
            }));
  }

  /// - Mark: additional methods

  void _sendComment() {
    Request()
        .sendComment(
            widget.blname, widget.id, widget.type, textEditingController.text)
        .then((value) {
      if (value) {
        _pushedNewComment = true;
        textEditingController.clear();
        loadData();
      }

      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  void loadData() {
    Request().getPost(widget.type, widget.blname, widget.id).then((value) {
      setState(() {
        postInfo = value;
        _canComment = canComment();
      });
    });
  }

  void updateData() {
    var comm = postInfo['comments'] as List;
    var index = comm.length;
    Request()
        .getNewComments(widget.blname, widget.id, index.toString(), widget.type)
        .then((value) {
      if (value.isNotEmpty) {
        setState(() {
          comm.addAll(value);
        });
      }
    });
  }

  void checkUpdates() {
    var comm = postInfo['comments'] as List;
    var index = comm.length;

    Request()
        .checkNewComments(
            widget.blname, widget.id, index.toString(), widget.type)
        .then((value) {
      if (value) {
        debugPrint('есть новые коммы');
        _pushedNewComment = false;
        HapticFeedback.vibrate();
        player.play(AssetSource('audio/sound.mp3'), volume: 1.0);
        loadData();
      }
    });
  }

  bool canComment() {
    if (widget.type != PostType.forum) {
      return (postInfo['post'] as Post).canComment!;
    }
    return true;
  }

  Future<void> _pullRefresh() async {
    _pushedNewComment = false;
    setState(() {
      postInfo = {'post': null, 'comments': List};
    });
    loadData();
  }

  Future<void> _attachImages() async {
    List<XFile>? pickedFiles =
        await ImagePicker().pickMultiImage(imageQuality: 100);
    // ignore: use_build_context_synchronously
    Utils().loadImages(pickedFiles, textEditingController, context);
  }
}
