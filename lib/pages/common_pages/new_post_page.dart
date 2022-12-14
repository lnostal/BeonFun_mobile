// ignore_for_file: use_build_context_synchronously

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_beonfun/models/post.dart';

import '../../net/general_network.dart';
import '../../utils/utils.dart';

class WriteNewPost extends StatefulWidget {
  const WriteNewPost({super.key});

  @override
  State<WriteNewPost> createState() => _WriteNewPostState();
}

class _WriteNewPostState extends State<WriteNewPost> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  var defaultPostAccess = PostPrivateSettings.users;
  var defaultCommAccess = PostPrivateSettings.users;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('Новый пост'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                        minLines: 1,
                        maxLines: 10,
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color),
                        controller: _messageController,
                        scrollController: _scrollController,
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
                createAccessView('Доступ', defaultPostAccess, (value) {
                  setState(() {
                    defaultPostAccess = value;
                  });
                }),
                createAccessView('Комментирование', defaultCommAccess, (value) {
                  setState(() {
                    defaultCommAccess = value;
                  });
                }),
              ],
            ),
          ),
        ));
  }

  Widget createAccessView(String type, PostPrivateSettings access,
      Function(PostPrivateSettings value) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 10),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(type)),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 1))
            ]),
        items: accessList(),
        hint: Text(type),
        icon: Icon(Icons.keyboard_arrow_down),
        value: access,
        onChanged: (value) {
          onChanged(value!);
        },
      ),
    );
  }

  List<DropdownMenuItem<PostPrivateSettings>> accessList() {
    return [
      DropdownMenuItem<PostPrivateSettings>(
          child: Text('Все', style: Theme.of(context).textTheme.bodyMedium),
          value: PostPrivateSettings.all),
      DropdownMenuItem<PostPrivateSettings>(
          child: Text('Пользователи',
              style: Theme.of(context).textTheme.bodyMedium),
          value: PostPrivateSettings.users),
      DropdownMenuItem<PostPrivateSettings>(
          child: Text('Друзья', style: Theme.of(context).textTheme.bodyMedium),
          value: PostPrivateSettings.friends),
      DropdownMenuItem<PostPrivateSettings>(
          child:
              Text('Только я', style: Theme.of(context).textTheme.bodyMedium),
          value: PostPrivateSettings.me)
    ];
  }

  Future<void> createPost() async {
    var title = _titleController.text;
    var message = _messageController.text;
    var prefs = await SharedPreferences.getInstance();
    String? blog = prefs.getString('blogStringId');

    var access = describeEnum(defaultPostAccess);
    var comaccess = describeEnum(defaultCommAccess);

    Request()
        .createPost(blog!, title, message, access, comaccess)
        .then((value) {
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
