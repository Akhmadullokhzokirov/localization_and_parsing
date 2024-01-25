// To parse this JSON data, do
//
//     final empCreate = empCreateFromJson(jsonString);

import 'dart:convert';

EmpCreate empCreateFromJson(String str) => EmpCreate.fromJson(json.decode(str));

String empCreateToJson(EmpCreate data) => json.encode(data.toJson());

class EmpCreate {
  String status;
  Data data;

  EmpCreate({
    required this.status,
    required this.data,
  });

  factory EmpCreate.fromJson(Map<String, dynamic> json) => EmpCreate(
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
