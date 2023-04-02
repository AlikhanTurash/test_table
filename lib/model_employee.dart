import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'constants.dart';

class Employee {
  final String name;
  final String surname;
  final double salary;

  Employee({required this.name, required this.surname, required this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      surname: json['surname'],
      salary: json['salary'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'salary': salary,
    };
  }

  String url = ApiConstants.baseUrl;

  static Future<List<Employee>> getDataFromWebSocket(String url) async {
    final completer = Completer<List<Employee>>();
    final socket = await WebSocket.connect(url);

    final employees = <Employee>[];

    socket.listen((data) {
      final jsonData = json.decode(data);
      final employee = Employee.fromJson(jsonData);
      employees.add(employee);
    }, onDone: () => completer.complete(employees));

    return completer.future;
  }
}
