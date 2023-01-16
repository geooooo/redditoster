class Post {
  final String id;
  final String? imageLink;
  final String title;
  final String description;
  final int plusCount;

  const Post({
    required this.id,
    this.imageLink,
    required this.title,
    required this.description,
    required this.plusCount,
  });
}