// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/pages/common_pages/user_diary_page.dart';
import 'package:flutter_beonfun/widgets/avatar_view.dart';

import '../../models/user.dart';
import '../root_pages/tabbar/messanger/open_message_dialog_page.dart';

class AboutUserPage extends StatefulWidget {
  User user;
  AboutUserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<AboutUserPage> createState() => _AboutUserPageState();
}

class _AboutUserPageState extends State<AboutUserPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text('О пользователе'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: SafeArea(
            child: Card(
                child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AvatarView(
                user: widget.user,
                type: AvatarType.profile,
                avatarSize: 140,
              ),
              Text(
                widget.user.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                widget.user.sign ?? '',
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              UserDiaryPage(user: widget.user)));
                    },
                    icon: Icon(
                      Icons.book,
                      size: 34,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 34 * 3, // idk why
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MessageDialogExpandedPage(user: widget.user)));
                      },
                      icon: Icon(
                        CupertinoIcons.bubble_right_fill,
                        size: 34,
                        color: Theme.of(context).colorScheme.primary,
                      ))
                ],
              )
            ],
          ),
        ))));
  }
}
