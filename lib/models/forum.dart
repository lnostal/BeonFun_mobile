class Forum {
  int id;
  String name;
  String title;
  Forum({
    required this.id,
    required this.name,
    required this.title,
  });

  factory Forum.fromMap(Map<String, dynamic> map) {
    return Forum(
        id: map['id'] as int,
        name: map['name'] as String,
        title: map['title'] as String);
  }

  factory Forum.getTypeData(ForumType type) {
    switch (type) {
      case ForumType.discussions:
        return Forum(id: 1, name: 'discussions', title: 'ПО');
      case ForumType.lady:
        return Forum(id: 1, name: 'lady', title: 'ЖФ');
      case ForumType.rpforum:
        return Forum(id: 1, name: 'rpforum', title: 'Ролевые');
      case ForumType.dating:
        return Forum(id: 1, name: 'dating', title: 'Знакомства');
      case ForumType.flood:
        return Forum(id: 1, name: 'flood', title: 'Флуд');
      case ForumType.computers:
        return Forum(id: 1, name: 'computers', title: 'Компьютеры');
    }
  }

  List<Forum> forumsList() {
    return [
      Forum.getTypeData(ForumType.discussions),
      Forum.getTypeData(ForumType.lady),
      Forum.getTypeData(ForumType.dating),
      Forum.getTypeData(ForumType.flood),
      Forum.getTypeData(ForumType.rpforum),
      Forum.getTypeData(ForumType.computers)
    ];
  }
}

enum ForumType {
  lady, // жф
  discussions, // по
  dating, // здл
  flood, // флуд
  computers, //компы
  rpforum // ролевки
}
