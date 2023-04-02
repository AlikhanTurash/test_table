import 'dart:developer';

import 'package:http/http.dart' as http;
import './constants.dart';
import './model_employee.dart';

class ApiService {
  Future<Employee?> getEmployees() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Employee _model =
            Employee.fromJson(response.body as Map<String, dynamic>);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
