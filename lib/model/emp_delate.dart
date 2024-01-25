// To parse this JSON data, do
//
//     final empDelete = empDeleteFromJson(jsonString);

import 'dart:convert';

EmpDelete empDeleteFromJson(String str) => EmpDelete.fromJson(json.decode(str));

String empDeleteToJson(EmpDelete data) => json.encode(data.toJson());

class EmpDelete {
  String status;
  String message;

  EmpDelete({
    required this.status,
    required this.message,
  });

  factory EmpDelete.fromJson(Map<String, dynamic> json) => EmpDelete(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}