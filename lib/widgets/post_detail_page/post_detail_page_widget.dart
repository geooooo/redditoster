import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
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
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: AppColor.postBackground,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Votes: ${post.plusCount}',
                  style: GoogleFonts.notoSans(
                    color: AppColor.postDescription,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  post.title,
                  style: GoogleFonts.ibmPlexSans(
                    color: AppColor.postTitle,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                MarkdownBody(
                  data: post.description,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
