import 'package:redditoster/models/app_state/post.dart';
import 'package:redditoster/services/http_service.dart';
import 'package:redditoster/services/internet_check/internet_check_service.dart';
import 'package:redditoster/services/storage/storage_service.dart';

class PostService {
  final HttpService _httpService;
  final InternetCheckService _internetCheckService;
  final StorageService _storageService;

  PostService(
    this._httpService,
    this._internetCheckService,
    this._storageService,
  );

  Future<List<Post>> loadPosts() async => 
    (await _internetCheckService.hasConnection)
      ? _loadPostsFromNetwork()
      : _loadPostsFromStorage();
  
  Future<List<Post>> _loadPostsFromNetwork() async {
    final response = await _httpService.loadPosts();
    final postDtos = response.posts;

    final posts = postDtos.map((dto) => Post(
      id: dto.id, 
      imageLink: dto.imageLink, 
      title: dto.title, 
      description: dto.description, 
      plusCount: dto.plusCount,
    )).toList();

    _storageService.save(posts);

    return posts;
  }

  Future<List<Post>> _loadPostsFromStorage() =>
    _storageService.load();
}