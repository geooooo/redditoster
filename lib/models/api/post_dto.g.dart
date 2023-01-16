// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDto _$PostDtoFromJson(Map<String, dynamic> json) => PostDto(
      imageLink: PostDto._imageLinkFromJson(json['thumbnail'] as String),
      description: json['selftext'] as String,
      plusCount: json['ups'] as int,
      id: json['id'] as String,
      title: json['title'] as String,
    );
