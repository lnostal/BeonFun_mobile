import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../net/general_network.dart';
import '../widgets/loader_view.dart';

class Utils {
  void showLoader(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.transparent,
            child: const Loader(),
          ),
        );
      },
    );
  }

  void loadImages(
      List<XFile>? images, TextEditingController textController, context) {
    if (images != null) {
      showLoader(context);
      Request().uploadImages(images, (value) {
        if (value.isNotEmpty) {
          for (var element in value) {
            textController.text += '[img-small-none-$element]';
            textController.selection =
                TextSelection.collapsed(offset: textController.text.length);
          }

          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pop();
          debugPrint('чет пошло не так');
        }
      }).onError((error, stackTrace) {
        Navigator.of(context).pop();
      });
    } else {}
  }
}
