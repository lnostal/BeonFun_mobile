///
///
///
///
class Helper {
  ///
  /// Да здравствуют регулярки
  /// (\[\w+\]) - [i][b][off] etc.
  /// (\[\/\w+\]) - [/i][/b][/off] etc.
  ///
  ///

  String removeBBCodeFromString(String data) {
    String finalString = data;

    if (data.contains('[spoiler]'.toUpperCase())) {
      finalString = finalString.split('[spoiler]'.toUpperCase()).first;

      finalString += "\nПодробнее >>>";
    }

    finalString = finalString.replaceAll(
        RegExp(r'(\[\w+\])|(\[\/\w+\])'), ''); //простые теги
    finalString = finalString.replaceAll('&gt;', '>');
    finalString = finalString.replaceAll('&lt;', '<');
    finalString = finalString.replaceAll('&quot;', '"'); // кавычки

    //print('$finalString');
    return finalString;
  }

  String setAvatarPlaceholderUrl() {
    return 'https://s1.hostingkartinok.com/uploads/images/2022/09/8b91b2fbfb0cddc9074591dc4b1cf932.png';
  }
}
