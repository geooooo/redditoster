import 'package:redditoster/models/app_state/post.dart';
import 'package:redditoster/services/http_service.dart';

class PostService {
  final HttpService _httpService;

  PostService(this._httpService);

  Future<List<Post>> loadPosts() async {
    final response = await _httpService.loadPosts();
    final postDtos = response.posts;

    return postDtos.map((dto) => Post(
      id: dto.id, 
      imageLink: dto.imageLink, 
      title: dto.title, 
      description: dto.description, 
      plusCount: dto.plusCount,
    )).toList();
  }
}