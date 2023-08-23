import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../API/api_url.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
        baseUrl: ApiURL.BASE_URL,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer 15321|CDMpHxFKw0XRHIRJwSwrUCKp0vxiDlSqevDPJSGj",
        });
    _dio = Dio(options);
  }
  Future<Response> getData(String endPoint) {
    return _dio.get(endPoint);
  }

  Future get(
    String endpoint, {
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    _dio.get(endpoint).then((res) {
      if (onSuccess != null) onSuccess(res.data);
      log(("success url is = ${ApiURL.BASE_URL} \n response data ${jsonEncode(res.data)}"));
      log(("success url is = $endpoint \n response data ${jsonEncode(res.data)}"));
    }).catchError((error) {
      if (onError != null) onError(error);
      onError!(error);
      log(("error url is = $endpoint \n error response data $error"));
    });
  }

  Future post(
    String endpoint,
    Map<String, dynamic> params, {
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    _dio.post(endpoint, data: params).then((res) async {
      if (onSuccess != null) {
        onSuccess(res.data);
        log(("success url is = ${ApiURL.BASE_URL} \n response data ${jsonEncode(res.data)}"));
        log(("success url is = $endpoint \n response data ${jsonEncode(res.data)}"));
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        log(("error url is = $endpoint \n error response data $error"));
      }
      ;
    });
  }

  String handleError(DioError error) {
    String errorDescription = "";

    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;

      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;

      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;

      case DioErrorType.badCertificate:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.badResponse:
        errorDescription =
            "Received invalid status code: ${dioError.response!.statusCode}";
        break;
      case DioErrorType.connectionError:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.unknown:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
    }
    return errorDescription;
  }
}
