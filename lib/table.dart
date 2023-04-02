import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  //row data
  List rows = [
    {
      "name": 'George',
      "surname": 'Orwell',
      "salary": '10 000',
    },
    {
      "name": 'Alikhan',
      "surname": 'Turash',
      "salary": '5 000',
    },
    {
      "name": 'Jack',
      "surname": 'London',
      "salary": '3 000',
    },
  ];
//Headers or Columns
  List headers = [
    {"title": 'Name', 'index': 1, 'key': 'name'},
    {"title": 'Surname', 'index': 2, 'key': 'surname'},
    {"title": 'Salary', 'index': 3, 'key': 'salary'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Editable(
            columnRatio: 0.25,
            borderWidth: 1,
            zebraStripe: true,
            columns: headers,
            rows: rows,
            showCreateButton: true,
            tdStyle: TextStyle(fontSize: 20),
            showSaveIcon: true, //set true
            borderColor: Colors.grey.shade300,
            onSubmitted: (value) {
              print(value);
            },
            onRowSaved: (value) {
              //added line
              print(value); //prints to console
            },
          ),
        ),
      ),
    );
  }
}
