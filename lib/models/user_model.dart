import 'dart:convert';

class User {
  final String? id;
  final String? name;
  User(
      {this.id,
        this.name});

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name:json["name"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name":name
  };
}