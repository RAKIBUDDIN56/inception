import 'package:dio/dio.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/API/api_url.dart';

class ExamsJoinRepository {
  Future<Response> examJoin(int id) {
    return ApiService()
        .getData(ApiURL.EXAMS_JOIN.replaceAll("{id}", id.toString()));
  }
}
