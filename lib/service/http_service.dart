import 'dart:convert';

import 'package:http/http.dart';
import 'package:localization/model/employees.dart';

class Network {
  static String BASE =
      "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  /* Http Apis*/

  static String API_LIST = "/api/v1/employees";
  static String API_LIST_Id = "/api/v1/employee/";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE ="/api/v1/delete/"; //{id}


  /* Http Request*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var responce = await get(uri, headers: headers);
    if (responce.statusCode == 200) {
      return responce.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var responce = await post(uri, headers: headers, body: jsonEncode(params));
    if (responce.statusCode == 200 || responce.statusCode == 201) {
      return responce.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var responce = await put(uri, headers: headers, body: jsonEncode(params));
    if (responce.statusCode == 200 || responce.statusCode == 202) {
      return responce.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var responce = await delete(uri, headers: headers);
    if (responce.statusCode == 200) {
      return responce.body;
    }
    return null;
  }
  /* Http Params*/

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      'name': employee.employeeName!,
      'salary': employee.employeeSalary.toString()!,
      'age': employee.employeeAge.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Employee employee) {
    Map<String, String> params = {};
    params.addAll({
      'id': employee.id.toString(),
      'name': employee.employeeName!,
      'salary': employee.employeeSalary!.toString(),
      'age': employee.employeeAge.toString(),
    });
   // LogService.w(params.toString());
    return params;
  }

  /*Http Parsing*/

  // # Employee
  static List<Employee> parseEmployeesList(String responce) {
    dynamic json = jsonDecode(responce);
    var data = List<Employee>.from(json.map((x) => Employee.fromJson(x)));
    return data;
  }

}
