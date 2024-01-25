// To parse this JSON data, do
//
//     final empDetail = empDetailFromJson(jsonString);

import 'dart:convert';

EmpDetail empDetailFromJson(String str) => EmpDetail.fromJson(json.decode(str));

String empDetailToJson(EmpDetail data) => json.encode(data.toJson());

class EmpDetail {
  String status;
  Employeeid employeeid;

  EmpDetail({
    required this.status,
    required this.employeeid,
  });

  factory EmpDetail.fromJson(Map<String, dynamic> json) => EmpDetail(
    status: json["status"],
    employeeid: Employeeid.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": employeeid.toJson(),
  };
}

class Employeeid {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Employeeid({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Employeeid.fromJson(Map<String, dynamic> json) => Employeeid(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}