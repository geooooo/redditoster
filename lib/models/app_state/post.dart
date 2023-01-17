import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
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

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

   Map<String, dynamic> toJson() => _$PostToJson(this);
}