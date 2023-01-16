import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable(createToJson: false)
class PostDto {
  final String x;

  const PostDto({ required this.x });

  factory PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);
}