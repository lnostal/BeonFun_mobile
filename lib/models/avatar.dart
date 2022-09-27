class Avatar {
  int name;
  String extension;
  final String _s3 = 'https://i0.beon.fun/';

  Avatar({
    required this.name,
    required this.extension,
  });

  factory Avatar.fromMap(Map<String, dynamic> map) {
    return Avatar(name: map['idx'], extension: map['ext']);
  }

  String? url(String basePath) {
    return '$_s3$basePath/avatars/$name.$extension';
  }
}
