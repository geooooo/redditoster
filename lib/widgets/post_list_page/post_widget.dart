import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redditoster/common/app_color.dart';
import 'package:redditoster/models/app_state/post.dart';
import 'package:transparent_image/transparent_image.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  bool get _hasImage => post.imageLink != null;

  const PostWidget({ 
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColor.postBackground,
      border: Border.all(
        color: AppColor.postBorder,
        width: 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: GoogleFonts.ibmPlexSans(
            color: AppColor.postTitle,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        if (_hasImage) ...[
          const SizedBox(height: 8),
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(post.imageLink!),
          ),
        ],
      ],
    ),
  );
}