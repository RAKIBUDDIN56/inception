class ArchiveCategoryModel {
  ArchiveCategoryModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory ArchiveCategoryModel.fromJson(Map<String, dynamic> json) =>
      ArchiveCategoryModel(
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
    required this.categories,
  });

  final List<ArchiveCategory> categories;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        categories: List<ArchiveCategory>.from(
            json["categories"].map((x) => ArchiveCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class ArchiveCategory {
  ArchiveCategory({
    required this.id,
    required this.name,
    this.description,
  });

  final int id;
  final String name;
  final String? description;

  factory ArchiveCategory.fromJson(Map<String, dynamic> json) =>
      ArchiveCategory(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
