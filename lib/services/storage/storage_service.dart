import 'package:redditoster/models/app_state/post.dart';

abstract class StorageService {
  Future<bool> save(List<Post> posts);
  Future<List<Post>> load();
}