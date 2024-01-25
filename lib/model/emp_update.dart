// To parse this JSON data, do
//
//     final empUpdate = empUpdateFromJson(jsonString);

import 'dart:convert';

EmpUpdate empUpdateFromJson(String str) => EmpUpdate.fromJson(json.decode(str));

String empUpdateToJson(EmpUpdate data) => json.encode(data.toJson());

class EmpUpdate {
  String status;
  Data data;

  EmpUpdate({
    required this.status,
    required this.data,
  });

  factory EmpUpdate.fromJson(Map<String, dynamic> json) => EmpUpdate(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String name;
  String salary;
  String age;
  int id;

  Data({
    required this.name,
    required this.salary,
    required this.age,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    salary: json["salary"],
    age: json["age"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "salary": salary,
    "age": age,
    "id": id,
  };
}
