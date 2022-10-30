// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beonfun/models/forum.dart';
import 'package:image_picker/image_picker.dart';

import '../../net/general_network.dart';
import '../../utils/utils.dart';

class WriteForumNewPost extends StatefulWidget {
  const WriteForumNewPost({super.key});

  @override
  State<WriteForumNewPost> createState() => _WriteForumNewPostState();
}

class _WriteForumNewPostState extends State<WriteForumNewPost> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  String defaultForum = describeEnum(ForumType.discussion);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('Написать на форум'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                createAccessView(defaultForum, (value) {
                  defaultForum = value;
                }),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16, top: 10, right: 16, bottom: 10),
                    child: TextField(
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                      controller: _titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Заголовок'),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 10, right: 16, bottom: 10),
                  child: Scrollbar(
                    trackVisibility: true,
                    child: TextField(
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color),
                        controller: _messageController,
                        minLines: 1,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Текст',
                        )),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: _attachImages,
                        icon: Icon(Icons.attach_file,
                            color: Theme.of(context).colorScheme.primary)),
                    IconButton(
                        onPressed: _createPhoto,
                        icon: Icon(Icons.add_a_photo,
                            color: Theme.of(context).colorScheme.primary)),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: TextButton(
                            onPressed: createPost,
                            child: const Text(
                              'Отправить',
                              style: TextStyle(fontSize: 16),
                            )))
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget createAccessView(String forum, Function(String value) onChanged) {
    var list = Forum.getTypeData(ForumType.discussion).forumsList();

    List<DropdownMenuItem<String>> widgets = [];

    for (Forum forum in list) {
      widgets.add(DropdownMenuItem<String>(
          child:
              Text(forum.title, style: Theme.of(context).textTheme.bodyMedium),
          value: forum.name));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 10),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text('Форум')),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, //  Theme.of(context).disabledColor,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 1))
            ]),
        items: widgets,
        hint: Text('Форум'),
        icon: Icon(Icons.keyboard_arrow_down),
        value: forum,
        onChanged: (value) {
          onChanged(value!);
        },
      ),
    );
  }

  Future<void> createPost() async {
    var title = _titleController.text;
    var message = _messageController.text;

    debugPrint('title: $title\nmessage: $message\ntype: $defaultForum');

    Request().createForumPost(defaultForum, title, message).then((value) {
      if (value) {
        Navigator.of(context).pop();
      }

      FocusScope.of(context).requestFocus();
    });
  }

  Future<void> _attachImages() async {
    List<XFile>? pickedFiles =
        await ImagePicker().pickMultiImage(imageQuality: 100);
    Utils().loadImages(pickedFiles, _messageController, context);
  }

  Future<void> _createPhoto() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Utils().loadImages([pickedFile], _messageController, context);
    }
  }
}
