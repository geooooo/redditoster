import 'package:redditoster/models/actions/action.dart';
import 'package:redditoster/models/app_state/post.dart';

class LoadPostsSuccessAction implements Action {
  final List<Post> posts;

  const LoadPostsSuccessAction(this.posts);
}