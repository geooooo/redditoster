import 'package:flutter/material.dart';
import 'package:redditoster/common/app_color.dart';
import 'package:redditoster/models/app_state/post.dart';

class PostDetailPageWidget extends StatelessWidget {
  final Post post;

  const PostDetailPageWidget({ 
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.mainBackground,
    body: Column(
      children: [
        Text(post.plusCount.toString()),
        Text(post.title),
        Text(post.description),
      ],
    ),
  );
}
