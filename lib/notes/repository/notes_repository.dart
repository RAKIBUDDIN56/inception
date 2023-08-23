import 'package:dio/dio.dart';
import 'package:inception/API/api_services.dart';
import 'package:inception/API/api_url.dart';

class NotesRepository {
  Future<Response> notes() {
    return ApiService().getData(ApiURL.NOTES);
  }
}
