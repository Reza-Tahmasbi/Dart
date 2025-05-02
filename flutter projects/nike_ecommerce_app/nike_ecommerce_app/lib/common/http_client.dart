import 'package:dio/dio.dart';
final httpClient = Dio(BaseOptions(
  baseUrl: "https://fapi.7learn.com/api/v1/",  // Change http to https
  connectTimeout: Duration(seconds: 30),  // Add timeout
  receiveTimeout: Duration(seconds: 30),
));
