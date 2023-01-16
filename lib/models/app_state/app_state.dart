import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:redditoster/models/app_state/post.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Post> get posts;
  
  AppState._();
  factory AppState() = _$AppState;

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(AppStateBuilder b) => b
    ..posts.replace([]);
}