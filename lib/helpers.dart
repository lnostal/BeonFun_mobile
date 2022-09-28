import 'package:flutter/material.dart';

class Helper {
  final String _urlRegExp =
      r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';

  final String _imgTagsRegExp =
      r'\[img-\w+-\w+-(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+.';

  String removeBBCodeFromString(String data) {
    String finalString = data;

    if (data.contains('[spoiler]'.toUpperCase())) {
      finalString = finalString.split('[spoiler]'.toUpperCase()).first;

      finalString += "\nПодробнее >>>";
    }

    finalString =
        finalString.replaceAll(RegExp(r'(\[(|\/)\w+\])'), ''); //простые теги
    finalString = finalString.replaceAll('&gt;', '>');
    finalString = finalString.replaceAll('&lt;', '<');
    finalString = finalString.replaceAll('&quot;', '"'); // кавычки

    finalString = _replaceAllImages(finalString);

    return finalString;
  }

  String toRenderedString(String string) {
    String str = string;

    str = str.replaceAll('&gt;', '>');
    str = str.replaceAll('&lt;', '<');
    str = str.replaceAll('&quot;', '"');

    str = str.replaceAll(RegExp(r'(\[(|\/)OFF\])'), '');
    str = str.replaceAll(RegExp(r'(\[(|\/)JUSTIFY\])'), '');
    str = str.replaceAll(RegExp(r'(\[(|\/)CENTER\])'), '');
    str = str.replaceAll(RegExp(r'(\[(|\/)RIGHT\])'), '');
    str = str.replaceAll(RegExp(r'(\[(|\/)SPOILER\])'), '');

// я психанула и ебала регулярки сорян борян потом переделаю
    str = str.replaceAll('B]', 'b]');
    str = str.replaceAll('I]', 'i]');
    str = str.replaceAll('S]', 's]');
    str = str.replaceAll('U]', 'u]');
    str = str.replaceAll('H]', 'h1]');

    str = _replaceAllImages(str);

    return str;
  }

  String _replaceAllImages(String str) {
    List<String> imageTags = [];
    List<String> imageUrls = [];

    Iterable<RegExpMatch> matches = RegExp(_imgTagsRegExp).allMatches(str);

    for (var element in matches) {
      imageTags.add(str.substring(element.start, element.end).toString());

      debugPrint(str.substring(element.start, element.end).toString());
    }

    for (var tag in imageTags) {
      RegExpMatch? match = RegExp(_urlRegExp).firstMatch(tag);
      if (match != null) {
        imageUrls.add(tag.substring(match.start, match.end).toString());

        debugPrint(tag.substring(match.start, match.end).toString());
      }
    }

    if (imageTags.length == imageUrls.length) {
      imageTags.asMap().forEach((index, value) {
        str = str.replaceFirst(
            imageTags[index], '[img]${imageUrls[index]}[/img]');
      });
    }

    return str;
  }

  String setAvatarPlaceholderUrl() {
    return 'https://s1.hostingkartinok.com/uploads/images/2022/09/8b91b2fbfb0cddc9074591dc4b1cf932.png';
  }
}
