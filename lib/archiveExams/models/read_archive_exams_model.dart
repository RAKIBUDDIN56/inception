class ReadArchiveExamsModel {
  ReadArchiveExamsModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory ReadArchiveExamsModel.fromJson(Map<String, dynamic> json) =>
      ReadArchiveExamsModel(
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
    required this.exam,
    required this.questions,
  });

  final Exam exam;
  final List<QuestionArchiveExams> questions;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        exam: Exam.fromJson(json["exam"]),
        questions: List<QuestionArchiveExams>.from(
            json["questions"].map((x) => QuestionArchiveExams.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "exam": exam.toJson(),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Exam {
  Exam({
    required this.id,
    required this.title,
    required this.syllabus,
    required this.marksPerQuestion,
    required this.duration,
  });

  final int id;
  final String title;
  final String syllabus;
  final int marksPerQuestion;
  final int duration;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["id"],
        title: json["title"],
        syllabus: json["syllabus"],
        marksPerQuestion: json["marks_per_question"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "syllabus": syllabus,
        "marks_per_question": marksPerQuestion,
        "duration": duration,
      };
}

class QuestionArchiveExams {
  QuestionArchiveExams({
    required this.id,
    required this.questionText,
    required this.imagePath,
    required this.imageQuestion0,
    required this.imageQuestion1,
    required this.imageQuestion2,
    required this.explanation,
    required this.imageExplanation,
    required this.subjectId,
    required this.options,
  });

  final int id;
  final String questionText;
  final ImagePath imagePath;
  final String imageQuestion0;
  final String imageQuestion1;
  final String imageQuestion2;
  final String explanation;
  final String imageExplanation;
  final int subjectId;
  final List<Option> options;

  factory QuestionArchiveExams.fromJson(Map<String, dynamic> json) => QuestionArchiveExams(
        id: json["id"],
        questionText: json["question_text"],
        imagePath: imagePathValues.map[json["image_path"]]!,
        imageQuestion0: json["image_question_0"],
        imageQuestion1: json["image_question_1"],
        imageQuestion2: json["image_question_2"],
        explanation: json["explanation"],
        imageExplanation: json["image_explanation"],
        subjectId: json["subject_id"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_text": questionText,
        "image_path": imagePathValues.reverse[imagePath],
        "image_question_0": imageQuestion0,
        "image_question_1": imageQuestion1,
        "image_question_2": imageQuestion2,
        "explanation": explanation,
        "image_explanation": imageExplanation,
        "subject_id": subjectId,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

enum ImagePath { STORAGE_ASDO_IMAGES_QUESTIONS }

final imagePathValues = EnumValues({
  "/storage/asdo/images/questions/": ImagePath.STORAGE_ASDO_IMAGES_QUESTIONS
});

class Option {
  Option({
    required this.id,
    required this.optionNumber,
    required this.optionText,
    this.imagePath,
    required this.imageOption,
    required this.isCorrect,
  });

  final int id;
  final String optionNumber;
  final String optionText;
  final String? imagePath;
  final String imageOption;
  final int isCorrect;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        optionNumber: json["option_number"]!,
        optionText: json["option_text"],
        imagePath: json["image_path"],
        imageOption: json["image_option"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "option_number": optionNumberValues.reverse[optionNumber],
        "option_text": optionText,
        "image_path": imagePath,
        "image_option": imageOption,
        "is_correct": isCorrect,
      };
}

enum OptionNumber { A, B, C, D, E }

final optionNumberValues = EnumValues({
  "A": OptionNumber.A,
  "B": OptionNumber.B,
  "C": OptionNumber.C,
  "D": OptionNumber.D,
  "E": OptionNumber.E
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
