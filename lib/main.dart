import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redditoster/models/app_state/app_state.dart';
import 'package:redditoster/services/di_service.dart';
import 'package:redditoster/widgets/app_widget.dart';

void main() {
  final storeFactory = DiService().storeFactory;

  runApp(StoreProvider<AppState>(
    store: storeFactory.create(),
    child: const AppWidget(),
  ));
}
  