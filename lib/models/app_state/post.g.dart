// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      imageLink: json['imageLink'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      plusCount: json['plusCount'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'imageLink': instance.imageLink,
      'title': instance.title,
      'description': instance.description,
      'plusCount': instance.plusCount,
    };
