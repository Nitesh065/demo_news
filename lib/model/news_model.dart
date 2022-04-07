// To parse this JSON data, do
//
//     final demoNewsModel = demoNewsModelFromJson(jsonString);

import 'dart:convert';

List<DemoNewsModel> demoNewsModelFromJson(String str) => List<DemoNewsModel>.from(json.decode(str).map((x) => DemoNewsModel.fromJson(x)));

String demoNewsModelToJson(List<DemoNewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemoNewsModel {
  DemoNewsModel({
    this.name,
    this.images,
    this.gender,
    this.species,
    this.homePlanet,
    this.occupation,
    this.sayings,
    this.id,
    this.age,
  });

  Name? name;
  Images? images;
  Gender? gender;
  String? species;
  String? homePlanet;
  String? occupation;
  List<String>? sayings;
  int? id;
  String? age;

  factory DemoNewsModel.fromJson(Map<String, dynamic> json) => DemoNewsModel(
    name: Name.fromJson(json["name"]),
    images: Images.fromJson(json["images"]),
    gender: genderValues.map![json["gender"]],
    species: json["species"],
    homePlanet: json["homePlanet"] == null ? null : json["homePlanet"],
    occupation: json["occupation"],
    sayings: List<String>.from(json["sayings"].map((x) => x)),
    id: json["id"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "name": name!.toJson(),
    "images": images!.toJson(),
    "gender": genderValues.reverse[gender],
    "species": species,
    "homePlanet": homePlanet == null ? null : homePlanet,
    "occupation": occupation,
    "sayings": List<dynamic>.from(sayings!.map((x) => x)),
    "id": id,
    "age": age,
  };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE
});

class Images {
  Images({
    this.headShot,
    this.main,
  });

  String? headShot;
  String? main;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    headShot: json["head-shot"],
    main: json["main"],
  );

  Map<String, dynamic> toJson() => {
    "head-shot": headShot,
    "main": main,
  };
}

class Name {
  Name({
    this.first,
    this.middle,
    this.last,
  });

  String? first;
  String? middle;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"],
    middle: json["middle"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "middle": middle,
    "last": last,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
