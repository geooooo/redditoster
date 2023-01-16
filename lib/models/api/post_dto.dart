import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable(createToJson: false)
class PostDto {  
  @JsonKey(
    name: 'thumbnail',
    fromJson: _imageLinkFromJson,
  )
  final String? imageLink;

  @JsonKey(name: 'selftext')
  final String description;

  @JsonKey(name: 'ups')
  final int plusCount;

  final String id;

  final String title;

  const PostDto({ 
    required this.imageLink,
    required this.description,
    required this.plusCount,
    required this.id,
    required this.title,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);

  static String? _imageLinkFromJson(String value) {
    final isImage = value.endsWith('.png')  ||  
                    value.endsWith('.jpeg') || 
                    value.endsWith('.jpg');

    return isImage? value : null;
  }
}