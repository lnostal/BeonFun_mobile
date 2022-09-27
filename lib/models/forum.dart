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
}
