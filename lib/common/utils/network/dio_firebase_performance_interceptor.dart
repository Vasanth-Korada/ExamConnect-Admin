/*
*  dio_firebase_performance_interceptor.dart
*
*  Created by - Open Source Author @Github
*  Source: https://github.com/eyeem/dio_firebase_performance
*  Copyright © 2021 abhibus.com. All rights reserved.
*/

import 'package:dio/dio.dart';
//import 'package:firebase_performance/firebase_performance.dart';

/// [Dio] client interceptor that hooks into request/response process
/// and calls Firebase Metric API in between. The request key is calculated
// ignore: comment_references
/// based upon [extra] field hash code which appears to be the same across
/// [onRequest], [onResponse] and [onError] calls.
///
/// Additionally there is no good API of obtaining content length from interceptor
/// API so we're "approximating" the byte length based on headers & request data.
/// If you're not fine with this, you can provide your own implementation in the constructor
///
/// This interceptor might be counting parsing time into elapsed API call duration.
/// I am not fully aware of [Dio] internal architecture.
class DioFirebasePerformanceInterceptor extends Interceptor {
DioFirebasePerformanceInterceptor(
      {this.requestContentLengthMethod = defaultRequestContentLength,
        this.responseContentLengthMethod = defaultResponseContentLength});

  /// key: requestKey hash code, value: ongoing metric
  // final _map = <int, HttpMetric>{};
  final RequestContentLengthMethod requestContentLengthMethod;
  final ResponseContentLengthMethod responseContentLengthMethod;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      print('===========BEFORE==============');
      print(options.headers.toString());
      // options.headers["Access-Control-Allow-Origin"]=  "*";
      //options.headers['User-Agent'] = 'Mozilla/5.0 (Linux; Android 5.0; SM-G900P Build/LRX21T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Mobile Safari/537.36';

      /*final metric = FirebasePerformance.instance.newHttpMetric(
          options.uri.normalized(), options.method.asHttpMethod()!);

      final requestKey = options.extra.hashCode;
      _map[requestKey] = metric;
      final requestContentLength = requestContentLengthMethod(options);
      await metric.start();

      // ignore: todo
      //TODO call a Performance Wrapper to start the Metric for all other integrations Ex: Maps SDK Native Integrations and Firebase Performance SDK Flutter
      if (requestContentLength != null) {
        metric.requestPayloadSize = requestContentLength;
      }*/

    } catch (_) {}
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      /*final requestKey = response.requestOptions.extra.hashCode;
      final metric = _map[requestKey];
      metric?.setResponse(response, responseContentLengthMethod);
      await metric?.stop();
      // ignore: todo
      //TODO: call a Performance Wrapper to start the Metric for all other integrations Ex: Maps SDK Native Integrations and Firebase Performance SDK Flutter
      _map.remove(requestKey);*/
    } catch (_) {}
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
     /* final requestKey = err.requestOptions.extra.hashCode;
      final metric = _map[requestKey];
      metric?.setResponse(err.response, responseContentLengthMethod);
      await metric?.stop();
      _map.remove(requestKey);*/
    } catch (_) {}
    return super.onError(err, handler);
  }
}

typedef RequestContentLengthMethod = int? Function(RequestOptions options);
int? defaultRequestContentLength(RequestOptions options) {
  try {
    if (options.data is String || options.data is Map) {
      return options.headers.toString().length +
          (options.data?.toString().length ?? 0);
    }
  } catch (_) {
    return null;
  }
  return null;
}

typedef ResponseContentLengthMethod = int? Function(Response options);
int? defaultResponseContentLength(Response response) {
  if (response.data is String) {
    return (response.headers.toString().length) + (response.data?.toString().length??0);
  } else {
    return null;
  }
}

/*extension _ResponseHttpMetric on HttpMetric {
  void setResponse(Response? value,
      ResponseContentLengthMethod responseContentLengthMethod) {
    if (value == null) {
      return;
    }
    final responseContentLength = responseContentLengthMethod(value);
    if (responseContentLength != null) {
      responsePayloadSize = responseContentLength;
    }
    final contentType = value.headers.value.call(Headers.contentTypeHeader);
    if (contentType != null) {
      responseContentType = contentType;
    }
    if (value.statusCode != null) {
      httpResponseCode = value.statusCode;
    }
  }
}

extension _UriHttpMethod on Uri {
  String normalized() {
    return '$scheme://$host$path';
  }
}

extension _StringHttpMethod on String {
  HttpMethod? asHttpMethod() {
    switch (toUpperCase()) {
      case 'POST':
        return HttpMethod.Post;
      case 'GET':
        return HttpMethod.Get;
      case 'DELETE':
        return HttpMethod.Delete;
      case 'PUT':
        return HttpMethod.Put;
      case 'PATCH':
        return HttpMethod.Patch;
      case 'OPTIONS':
        return HttpMethod.Options;
      default:
        return null;
    }
  }
}*/
