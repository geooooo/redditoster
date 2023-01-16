// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadPostsResponse _$LoadPostsResponseFromJson(Map<String, dynamic> json) =>
    LoadPostsResponse(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
