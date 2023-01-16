import 'package:flutter/material.dart';
import 'package:redditoster/common/app_color.dart';
import 'package:redditoster/models/app_state/post.dart';
import 'package:redditoster/widgets/post_list_page/post_widget.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  final Future<void> Function() onRefresh;
  final void Function(Post) onTap;

  const PostListWidget({ 
    required this.posts,
    required this.onRefresh,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: RefreshIndicator(
      onRefresh: onRefresh,
      color: AppColor.loader,
      backgroundColor: AppColor.mainBackground,
      child: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostWidget(
          key: ValueKey(posts[index].id),
          post: posts[index],
          onTap: onTap,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    ),
  );
}