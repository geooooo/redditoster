import 'package:json_annotation/json_annotation.dart';
import 'package:redditoster/models/api/post_dto.dart';

part 'load_posts_response.g.dart';

@JsonSerializable(createToJson: false)
class LoadPostsResponse { 
  final List<PostDto> posts;

  const LoadPostsResponse({ required this.posts });

  factory LoadPostsResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    final childrens = data['children'] as List<dynamic>;
    final posts = childrens.map((children) =>
      (children as Map<String, dynamic>)['data']
    ).toList();

    return _$LoadPostsResponseFromJson({ 'posts': posts });
  }
}