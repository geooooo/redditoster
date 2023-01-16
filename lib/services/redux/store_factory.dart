import 'package:redditoster/models/app_state/app_state.dart';
import 'package:redditoster/services/redux/middleware_service.dart';
import 'package:redditoster/services/redux/reducer_service.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class StoreFactory {
  final ReducerService _reducerService;
  final MiddlewareService _middlewareService;

  StoreFactory(
    this._reducerService,
    this._middlewareService,
  );

  Store<AppState> create() => Store<AppState>(
    _reducerService.reducer, 
    initialState: AppState(),
    middleware: [
      EpicMiddleware(_middlewareService.middleware), 
    ],
    syncStream: true,
    distinct: true,
  );
}