import 'package:dio/dio.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/API/api_url.dart';

class ArchiveExamsRepository {
  Future<Response> archiveExams(int id) {
    return ApiService()
        .getData(ApiURL.ARCHIVE_EXAMS.replaceAll("{id}", id.toString()));
  }

  Future<Response> readArchiveExams(int id) {
    return ApiService()
        .getData(ApiURL.READ_ARCHIVE_EXAMS.replaceAll("{id}", id.toString()));
  }
}
