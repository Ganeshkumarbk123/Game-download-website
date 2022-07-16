import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'endpoints.dart';



class ApiManager extends StatelessWidget {
  static final ApiManager _apiService = ApiManager._internal();

  ApiManager._internal();

  static ApiManager get instance => _apiService;

  Dio? _dio;
  String? token;
  bool isContentTypeJson = true;
  bool _isHttpRequest = false;
  bool _urlEncode = false;

  factory ApiManager() {
    return _apiService;
  }

  Dio? getDio({isJsonType = true, isHttpRequest=false, isUrlEncoded = false}) {
    isContentTypeJson = isJsonType;
    _urlEncode = isUrlEncoded;
    _isHttpRequest = isHttpRequest;
    _initAsync();
    return _dio;
  }

  _initAsync() async {
    if (_dio == null) {
      _dio = Dio();
      // _dio.options.baseUrl = "http://202.83.25.234:3393/Spaid/api/User/";
      _dio!.options.baseUrl = Endpoints.baseUrl;
      _dio!.options.contentType = Headers.jsonContentType;
      _dio!.interceptors..add(LogInterceptor());
      _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
    }
    if (token != null && token!.isNotEmpty) {
      _dio!.interceptors.clear();
      _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
      _dio!.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["x-auth-token"] = token;
        options.headers['content-Type'] = 'text/plain; charset=UTF-8';
        options.headers['Access-Control-Allow-Origin'] = '*';
        options.headers['Access-Control-Allow-Methods'] = 'GET , POST';
        if (isContentTypeJson)
          options.headers["Content-Type"] = "application/json";

        if (_urlEncode)
          options.headers["Content-Type"] = "application/x-www-form-urlencoded";

        if (_isHttpRequest)
          options.headers["X-Requested-With"] = "XMLHttpRequest";

        //return options;
      }));
    }
    _dio!.options.receiveTimeout = 20000;
  }

  void updateAuthToken(String data) {
    token = data;
    if (_dio != null) {
      _dio!.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers["x-auth-token"] = token;
       // return options;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
