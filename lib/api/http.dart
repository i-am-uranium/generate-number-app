import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:numbers/env/config.dart';
import 'package:numbers/env/dev.dart';

final List<int> successRange = List<int>.generate(100, (i) => i + 200);

final _config = Config.fromJson(devConfig);

final _baseOption = BaseOptions(
  baseUrl: _config.serviceEndpoint,
  receiveTimeout: 5000,
  connectTimeout: 5000,
  responseType: ResponseType.json,
);

Dio dio = Dio(_baseOption)
  ..interceptors.add(CookieManager(CookieJar()))
  ..interceptors.add(LogInterceptor());
