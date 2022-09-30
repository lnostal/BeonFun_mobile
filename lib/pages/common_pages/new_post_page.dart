import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../net/general_network.dart';

class WriteNewPost extends StatefulWidget {
  const WriteNewPost({super.key});

  @override
  State<WriteNewPost> createState() => _WriteNewPostState();
}

class _WriteNewPostState extends State<WriteNewPost> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Новый пост'),
          backgroundColor: CupertinoColors.white,
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
                  child: TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Title'),
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 10, right: 16, bottom: 10),
                child: TextField(
                    controller: _messageController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Post',
                    )),
              ),
              TextButton(
                  onPressed: createPost,
                  child: const Text(
                    'Post it',
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ));
  }

  Future<void> createPost() async {
    var title = _titleController.text;
    var message = _messageController.text;
    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

    Request().createPost(blog!, title, message).then((value) {
      if (value) {
        Navigator.of(context).pop();
      }

      FocusScope.of(context).requestFocus();
    });
  }
}
