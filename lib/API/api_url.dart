// ignore_for_file: constant_identifier_names

class ApiURL {
  static const String BASE_URL = "https://test.inceptionexam.com";
  static const String ARCHIVE_CATEGORY = "/api/v1/archive";
  static const String LIVE_EXAMS = "/api/v1/archive/2/exams?page=1";
  static const String ARCHIVE_EXAMS = "/api/v1/archive/{id}/exams";
  static const String PACKAGES = "/api/v1/packages";
  static const String NOTES = "/api/v1/notes";
  static const String READ_ARCHIVE_EXAMS = "/api/v1/archive/{id}/exam/913/read";
  static const String EXAMS_JOIN = "/api/v1/archive/{id}/exam/865";
}
