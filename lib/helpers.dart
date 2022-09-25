class Helper {
  /// Да здравствуют регулярки
  /// (\[\w+\]) - [i][b][off] etc.
  /// (\[\/\w+\]) - [/i][/b][/off] etc.
  ///
  ///

  String removeBBCodeFromString(String data) {
    //String example_string =
    //    '[b]Some stupid[/b] [i]text[/i] with awful tags [spoiler]and this is the part to cut[/spoiler]';
    String finalString = data;

    if (data.contains('[spoiler]'.toUpperCase())) {
      finalString = finalString.split('[spoiler]'.toUpperCase()).first;

      finalString += "\nПодробнее >>>";
    }

    finalString = finalString.replaceAll(
        RegExp(r'(\[\w+\])|(\[\/\w+\])'), ''); //простые теги теги
    finalString = finalString.replaceAll('&quot;', '"'); // кавычки

    print('$finalString');
    return finalString;
  }
}
