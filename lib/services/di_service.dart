import 'package:dio/dio.dart';
import 'package:redditoster/services/http_service.dart';
import 'package:redditoster/services/post_service.dart';
import 'package:redditoster/services/redux/middleware_service.dart';
import 'package:redditoster/services/redux/reducer_service.dart';
import 'package:redditoster/services/redux/store_factory.dart';

class DiService {
  static DiService? _instance;

  final Dio _dio;
  final HttpService _httpService;
  final PostService _postService;
  final StoreFactory _storeFactory;

  Dio get dio => _dio;
  HttpService get httpService => _httpService;
  PostService get postService => _postService;
  StoreFactory get storeFactory => _storeFactory;

  DiService._(
    this._dio,
    this._httpService,
    this._postService,
    this._storeFactory,
  );

  factory DiService() {
    if (_instance == null) {
      final dio = Dio();
      final httpService = HttpService(dio);
      final postService = PostService(httpService);
      final reducerService = ReducerService();
      final middlewareService = MiddlewareService(postService);
      final storeFactory = StoreFactory(reducerService, middlewareService);

      _instance = DiService._(
        dio, 
        httpService,
        postService,
        storeFactory,
      );
    }

    return _instance!;
  }
}