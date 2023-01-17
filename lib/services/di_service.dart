import 'package:dio/dio.dart';
import 'package:redditoster/services/http_service.dart';
import 'package:redditoster/services/internet_check/internet_check_service.dart';
import 'package:redditoster/services/internet_check/internet_check_service_impl.dart';
import 'package:redditoster/services/post_service.dart';
import 'package:redditoster/services/redux/middleware_service.dart';
import 'package:redditoster/services/redux/reducer_service.dart';
import 'package:redditoster/services/redux/store_factory.dart';
import 'package:redditoster/services/storage/storage_service.dart';
import 'package:redditoster/services/storage/storage_service_impl.dart';

class DiService {
  static DiService? _instance;

  final Dio _dio;
  final HttpService _httpService;
  final PostService _postService;
  final StoreFactory _storeFactory;
  final InternetCheckService _internetCheckService;
  final StorageService _storageService;

  Dio get dio => _dio;
  HttpService get httpService => _httpService;
  PostService get postService => _postService;
  StoreFactory get storeFactory => _storeFactory;
  InternetCheckService get internetCheckService => _internetCheckService;
  StorageService get storageService => _storageService;

  DiService._(
    this._dio,
    this._httpService,
    this._postService,
    this._storeFactory,
    this._internetCheckService,
    this._storageService,
  );

  factory DiService() {
    if (_instance == null) {
      final dio = Dio();
      final httpService = HttpService(dio);
      final internetCheckService = InternetCheckServiceImpl();
      final storageService = StorageServiceImpl();
      final postService = PostService(httpService, internetCheckService, storageService);
      final reducerService = ReducerService();
      final middlewareService = MiddlewareService(postService);
      final storeFactory = StoreFactory(reducerService, middlewareService);

      _instance = DiService._(
        dio, 
        httpService,
        postService,
        storeFactory,
        internetCheckService,
        storageService,
      );
    }

    return _instance!;
  }
}