import 'package:flutter/material.dart';
import 'package:redditoster/common/app_color.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({ super.key });
  
  @override
  Widget build(BuildContext context) => const Center(
    child: CircularProgressIndicator(
      color: AppColor.loader,
    ),
  );
}