class PackagesModel {
  PackagesModel({
    required this.status,
    required this.payload,
  });

  final bool status;
  final Payload payload;

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
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
    required this.packages,
  });

  final List<Package> packages;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}

class Package {
  Package({
    required this.id,
    required this.name,
    required this.description,
    required this.period,
    required this.price,
    required this.discountedPrice,
  });

  final int id;
  final String name;
  final String description;
  final int period;
  final int price;
  final int discountedPrice;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        period: json["period"],
        price: json["price"],
        discountedPrice: json["discounted_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "period": period,
        "price": price,
        "discounted_price": discountedPrice,
      };
}
