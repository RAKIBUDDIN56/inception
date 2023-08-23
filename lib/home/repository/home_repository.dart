import 'package:dio/dio.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/API/api_url.dart';
import 'package:inception/home/models/category_exams_model.dart';

class HomeRepository {
  Future<Response> liveExams() {
    return ApiService().getData(ApiURL.LIVE_EXAMS);
  }

  Future<Response> categoryArchiveExams() {
    return ApiService().getData(ApiURL.ARCHIVE_CATEGORY);
  }

 

  Future<Response> packaages() {
    return ApiService().getData(ApiURL.PACKAGES);
  }
}
