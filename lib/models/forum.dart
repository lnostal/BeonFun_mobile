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
      case ForumType.discussion:
        return Forum(id: 1, name: 'discussion', title: 'Просто общение');
      case ForumType.lady:
        return Forum(id: 2, name: 'lady', title: 'Женский форум');
      case ForumType.rpforum:
        return Forum(id: 6, name: 'rpforum', title: 'Ролевые');
      case ForumType.dating:
        return Forum(id: 4, name: 'dating', title: 'Знакомства');
      case ForumType.flood:
        return Forum(id: 3, name: 'flood', title: 'Флуд');
      case ForumType.computers:
        return Forum(id: 5, name: 'computers', title: 'Компьютеры');
    }
  }

  List<Forum> forumsList() {
    return [
      Forum.getTypeData(ForumType.discussion),
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
  discussion, // по
  dating, // здл
  flood, // флуд
  computers, //компы
  rpforum // ролевки
}
