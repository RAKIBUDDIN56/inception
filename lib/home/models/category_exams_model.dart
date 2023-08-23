class CategoryExamsModel {
  CategoryExamsModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory CategoryExamsModel.fromJson(Map<String, dynamic> json) =>
      CategoryExamsModel(
        status: json["status"],
        payload: Payload.fromJson(json["payload"]),
      );
  CategoryExamsModel copyWith({
    bool? status,
    Payload? payload,
  }) =>
      CategoryExamsModel(
        status: status ?? this.status,
        payload: payload ?? this.payload,
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

  final List<AllLiveExamsList> exams;
  final List<AllLiveExamsList> allExamsList;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        exams: List<AllLiveExamsList>.from(
            json["exams"].map((x) => AllLiveExamsList.fromJson(x))),
        allExamsList: List<AllLiveExamsList>.from(
            json["allExamsList"].map((x) => AllLiveExamsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exams": List<dynamic>.from(exams.map((x) => x.toJson())),
        "allExamsList": List<dynamic>.from(allExamsList.map((x) => x.toJson())),
      };
}

class AllLiveExamsList {
  AllLiveExamsList({
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

  factory AllLiveExamsList.fromJson(Map<String, dynamic> json) =>
      AllLiveExamsList(
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
