import 'dart:convert';
import 'package:redditoster/models/app_state/post.dart';
import 'package:redditoster/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  static const _key = 'posts';

  @override
  Future<bool> save(List<Post> posts) async {
    final instance = await SharedPreferences.getInstance();
    final encodedPosts = posts.map((post) => jsonEncode(post.toJson())).toList();
    
    return instance.setStringList(_key, encodedPosts);
  }

  @override
  Future<List<Post>> load() async {
    final instance = await SharedPreferences.getInstance();
    final encodedPosts = instance.getStringList(_key);
    
    if (encodedPosts == null || encodedPosts.isEmpty) {
      throw Exception();
    }

    final posts = encodedPosts.map((encodedPost) => 
      Post.fromJson(jsonDecode(encodedPost))
    );
    
    return posts.toList();
  }
}