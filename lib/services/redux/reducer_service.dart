import 'package:redditoster/models/actions/load_posts_success_action.dart';
import 'package:redditoster/models/app_state/app_state.dart';
import 'package:redux/redux.dart';

class ReducerService {
  Reducer<AppState> get reducer => combineReducers<AppState>([
    TypedReducer(_loadPostsSuccess),
  ]);

  AppState _loadPostsSuccess(AppState state, LoadPostsSuccessAction action) => state.rebuild((b) {
    final oldPosts = state.posts;
    final newPosts = action.posts;

    b.posts.replace(newPosts);

    if (oldPosts.isEmpty) {
      return b;
    }

    final index = oldPosts.indexWhere((oldPost) => oldPost.id == newPosts.last.id);
    if (index == -1) {
      b.posts.addAll(oldPosts);
    } else {
      b.posts.addAll(oldPosts.sublist(index + 1));
    }

    return b;
  });
}