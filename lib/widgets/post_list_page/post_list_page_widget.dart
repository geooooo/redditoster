import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redditoster/common/app_color.dart';
import 'package:redditoster/models/actions/load_posts_action.dart';
import 'package:redditoster/models/app_state/app_state.dart';
import 'package:redditoster/widgets/post_list_page/loader_widget.dart';
import 'package:redditoster/widgets/post_list_page/post_list_widget.dart';

class PostListPageWidget extends StatelessWidget {
  const PostListPageWidget({ super.key });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.mainBackground,
    body: SafeArea(
      child: StoreBuilder<AppState>(
        builder: (context, store) {
          if (store.state.posts.isEmpty) {
            store.dispatch(const LoadPostsAction());
            return const LoaderWidget();
          }

          return PostListWidget(
            posts: store.state.posts.toList(),
            onRefresh: () => _onRefresh(store.dispatch),
          );
        },
      ),
    ),
  );

  Future<void> _onRefresh(dynamic Function(dynamic) dispatch) async =>
    dispatch(const LoadPostsAction());
}
