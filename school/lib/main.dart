// main.dart

import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/create.dart';
import './screens/details.dart';
import './screens/edit.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + PHP CRUD',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/create': (context) => Create(
          refreshStudentList: () {
            // Add logic here to refresh the student list in the 'Home' screen
          },
        ),
        '/details': (context) => Details(
          student: /* your student object */,
        ),
        '/edit': (context) => Edit(
          student: /* your student object */,
        ),
      },
    );
  }
}
