class User {
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  late String _imagePath; // Use 'late' keyword for non-final initialization

  User({
    required String imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  }) : _imagePath = imagePath;

  String get imagePath => _imagePath;

  set imagePath(String newPath) {
    _imagePath = newPath;
  }
  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'name': name,
      'email': email,
      'about': about,
      'isDarkMode': isDarkMode,
    };
  }
}
