import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/widgets/avatar_view.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/message.dart';
import '../../../../models/user.dart';
import '../../../../net/general_network.dart';
import '../../../../widgets/loader_view.dart';
import 'open_message_dialog_page.dart';

class MessagesPage extends StatefulWidget {
  final String title;

  const MessagesPage({Key? key, required this.title}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<Message>? chats;
  String userId = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (chats == null) {
      return const Loader();
    }

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('Сообщения'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: SafeArea(
            child: FocusDetector(
          onFocusGained: _pullRefresh,
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: chats!.length,
              itemBuilder: (context, index) {
                return createMessageCard(chats![index]);
              }),
        )));
  }

  Widget createMessageCard(Message message) {
    User withWhom =
        (message.to!.id.toString() != userId) ? message.to! : message.from;

    String text = (message.to!.id.toString() == userId)
        ? message.text
        : 'Вы: ${message.text}';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MessageDialogExpandedPage(user: withWhom)));
      },
      child: Card(
          child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(children: [
                Badge(
                  child: AvatarView(user: withWhom),
                  badgeContent: Text(
                    '.',
                    style: TextStyle(color: Colors.transparent),
                  ),
                  position: BadgePosition(bottom: 10, end: 12),
                  showBadge:
                      message.isRead && message.to!.id.toString() == userId,
                ),
                Flexible(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(withWhom.name,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 6),
                      Text(text,
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis)
                    ])),
              ]))),
    );
  }

  Future<void> loadData() async {
    var prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('userId')!;

    Request().getChats().then((value) {
      setState(() {
        chats = value;
        chats!.sort((a, b) {
          if (b.isRead && b.to!.id.toString() == userId) {
            return 1;
          }
          return -1;
        });
      });
    });
  }

  Future<void> _pullRefresh() async {
    loadData();
  }
}
