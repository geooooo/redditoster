import 'package:dio/dio.dart';
import 'package:redditoster/models/api/load_posts_response.dart';

class HttpService {
  final Dio _dio;

  HttpService(this._dio);
  
  Future<LoadPostsResponse> loadPosts() async {
    final response = await _dio.get('https://reddit.com/r/flutterdev/new.json');
    return LoadPostsResponse.fromJson(response.data);
  }
}