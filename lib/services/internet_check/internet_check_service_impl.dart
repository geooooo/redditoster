import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:redditoster/services/internet_check/internet_check_service.dart';

class InternetCheckServiceImpl implements InternetCheckService {
  @override
  Future<bool> get hasConnection => InternetConnectionChecker().hasConnection;
}