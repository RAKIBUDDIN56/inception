class NotesModel {
  NotesModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
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
    required this.notes,
    required this.subjects,
  });

  final List<Notes> notes;
  final List<Subject> subjects;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        notes: List<Notes>.from(json["notes"].map((x) => Notes.fromJson(x))),
        subjects: List<Subject>.from(
            json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toJson())),
      };
}

class Notes {
  Notes({
    required this.id,
    required this.title,
    required this.content,
    required this.publishedAt,
  });

  final int id;
  final String title;
  final String content;
  final DateTime publishedAt;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        publishedAt: DateTime.parse(json["published_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "published_at": publishedAt.toIso8601String(),
      };
}

class Subject {
  Subject({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
