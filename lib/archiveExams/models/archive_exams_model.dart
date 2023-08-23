class ArchivedExamsModel {
  ArchivedExamsModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory ArchivedExamsModel.fromJson(Map<String, dynamic> json) =>
      ArchivedExamsModel(
        status: json["status"],
        payload: Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payload": payload.toJson(),
      };
}

class Payload {
  Payload({
    required this.exams,
    required this.allExamsList,
  });

  final List<dynamic> exams;
  final List<ArchiveExamsList> allExamsList;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        exams: List<dynamic>.from(json["exams"].map((x) => x)),
        allExamsList: List<ArchiveExamsList>.from(
            json["allExamsList"].map((x) => ArchiveExamsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exams": List<dynamic>.from(exams.map((x) => x)),
        "allExamsList": List<dynamic>.from(allExamsList.map((x) => x.toJson())),
      };
}

class ArchiveExamsList {
  ArchiveExamsList({
    required this.id,
    required this.title,
    required this.syllabus,
    required this.marksPerQuestion,
    required this.totalQuestion,
    required this.totalMarks,
    required this.duration,
    required this.startingTime,
    required this.isAvailable,
  });

  final int id;
  final String title;
  final String syllabus;
  final int marksPerQuestion;
  final int totalQuestion;
  final int totalMarks;
  final int duration;
  final DateTime startingTime;
  final bool isAvailable;

  factory ArchiveExamsList.fromJson(Map<String, dynamic> json) =>
      ArchiveExamsList(
        id: json["id"],
        title: json["title"],
        syllabus: json["syllabus"],
        marksPerQuestion: json["marks_per_question"],
        totalQuestion: json["total_question"],
        totalMarks: json["total_marks"],
        duration: json["duration"],
        startingTime: DateTime.parse(json["starting_time"]),
        isAvailable: json["is_available"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "syllabus": syllabus,
        "marks_per_question": marksPerQuestion,
        "total_question": totalQuestion,
        "total_marks": totalMarks,
        "duration": duration,
        "starting_time": startingTime.toIso8601String(),
        "is_available": isAvailable,
      };
}
