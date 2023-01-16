import 'package:dio/dio.dart';
import 'package:redditoster/models/api/post_dto.dart';

class HttpService {
  final Dio _dio;

  HttpService(this._dio);
  
  Future<List<PostDto>> loadPosts() async {
    final response = await _dio.get('https://reddit.com/r/flutterdev/new.json');
    response.data;
    return [];
  }
}