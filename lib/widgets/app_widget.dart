import 'package:flutter/material.dart';
import 'package:redditoster/common/app_color.dart';
import 'package:redditoster/common/app_intl.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({ super.key });

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: AppIntl.appTitle,
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Builder(
        builder: (context) => const Scaffold(
          backgroundColor: AppColor.mainBackground,
          body: Text('text'),
        ),
      ),
    ),
  );
}
