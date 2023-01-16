import 'package:dio/dio.dart';

class DiService {
  static final _instance = DiService();

  final _dio = Dio();
  Dio get dio => _dio;

  factory DiService() => _instance;
}