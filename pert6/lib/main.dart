import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Data'),
        ),
        body: const StudentList(),
      ),
    );
  }
}

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  void fetchStudentData() async {
    const String apiUrl = 'https://uts.djambred.my.id/api/student';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        students = data.map((student) {
          return {
            'id': student['id'],
            'name': student['name'],
            'email': student['email'],
            'password': student['password'],
            'created_at': student['created_at'],
            'updated_at': student['updated_at'],
          };
        }).toList();
      });
    } else {
      // If the server did not return a 200 OK response,
      // handle the error as needed.
      // print('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: const Text(
              'Hasil Fetch data dari: uts.djambred.my.id/api/student'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${students[index]['id']}'),
              Text('Name: ${students[index]['name']}'),
              Text('Email: ${students[index]['email']}'),
              Text('Password: ${students[index]['password']}'),
              Text('Created At: ${students[index]['created_at']}'),
              Text('Updated At: ${students[index]['updated_at']}'),
            ],
          ),
        );
      },
    );
  }
}
