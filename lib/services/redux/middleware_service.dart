import 'package:redditoster/models/actions/action.dart';
import 'package:redditoster/models/actions/load_posts_action.dart';
import 'package:redditoster/models/actions/load_posts_success_action.dart';
import 'package:redditoster/models/app_state/app_state.dart';
import 'package:redditoster/services/post_service.dart';
import 'package:redux_epics/redux_epics.dart';

class MiddlewareService {
  final PostService _postService;
  
  Epic<AppState> get middleware => combineEpics<AppState>([
    TypedEpic(_loadPosts),
  ]);

  MiddlewareService(this._postService);

  Stream<Action> _loadPosts(Stream<LoadPostsAction> actions, EpicStore<AppState> store) =>
    actions.asyncMap((action) async {
      try {
        final posts = await _postService.loadPosts();
        return LoadPostsSuccessAction(posts);
      } on Exception {
        await Future<void>.delayed(const Duration(seconds: 5));
        return const LoadPostsAction();
      }
    });
}