import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/message.dart';
import '../../../../models/user.dart';
import '../../../../net/general_network.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/comment_view.dart';
import '../../../../widgets/loader_view.dart';
import '../../../../widgets/send_message_view.dart';

class MessageDialogExpandedPage extends StatefulWidget {
  final User user;
  const MessageDialogExpandedPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MessageDialogExpandedPage> createState() =>
      _MessageDialogExpandedPageState();
}

class _MessageDialogExpandedPageState extends State<MessageDialogExpandedPage> {
  var textEditingController = TextEditingController();
  var scrollController = ScrollController();
  List<Message>? messages;
  late Timer timer;
  AudioPlayer player = AudioPlayer();

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
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('Диалог с ${widget.user.name}'),
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            leading: CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.of(context).pop(),
            )),
        child: SafeArea(
            child: SendMessageBottomView(
          childWidget: createBodyView(),
          controller: textEditingController,
          onSend: _sendComment,
          onAttach: _attachImages,
        )));
  }

  Widget createBodyView() {
    if (messages == null) {
      return const Loader();
    }

    return RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            reverse: true,
            controller: scrollController,
            itemCount: messages!.length,
            itemBuilder: (context, index) {
              Message mess = messages![index];

              return CommentView(user: mess.from, text: mess.text);
            }));
  }

  void _sendComment() {
    Request()
        .sendMessage(widget.user.blogStringId, textEditingController.text)
        .then((value) {
      if (value) {
        textEditingController.clear();
        loadData();
      }

      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  void loadData() {
    Request().getChatHistory(widget.user.blogStringId).then((value) {
      setState(() {
        messages = value;
        messages = messages?.reversed.toList();
      });
    });
  }

  Future<void> _pullRefresh() async {
    setState(() {
      messages = null;
    });
    loadData();
  }

  Future<void> _attachImages() async {
    List<XFile>? pickedFiles =
        await ImagePicker().pickMultiImage(imageQuality: 100);
    // ignore: use_build_context_synchronously
    Utils().loadImages(pickedFiles, textEditingController, context);
  }

  void checkUpdates() {
    Request()
        .checkNewMessages(
            widget.user.blogStringId, messages!.first.globalId.toString())
        .then((value) async {
      if (value) {
        debugPrint('есть новые сообщения');
        HapticFeedback.vibrate();
        player.play(AssetSource('audio/sound.mp3'), volume: 1.0);
        loadData();
      }
    });
  }
}
