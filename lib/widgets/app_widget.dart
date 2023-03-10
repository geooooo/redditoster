import 'package:flutter/material.dart';
import 'package:redditoster/widgets/post_list_page/post_list_page_widget.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ super.key });

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'Redditoster',
    debugShowCheckedModeBanner: false,
    home: PostListPageWidget(),
  );
}
