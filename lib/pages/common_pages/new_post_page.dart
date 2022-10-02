import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text('Новый пост'),
            border: Border(bottom: BorderSide(color: Colors.transparent))),
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
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: TextButton(
                          onPressed: createPost,
                          child: const Text(
                            'Post it',
                            style: TextStyle(fontSize: 16),
                          )))
                ],
              )
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
