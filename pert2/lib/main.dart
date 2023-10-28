import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.builder(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          // Generate widgets that display "Meja Restoran" starting from 1 to 4.
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text(
                'Meja Restoran ${index + 1}', // Add 1 to start from 1
                style: Theme.of(context).textTheme.headline6, // Use headline6
              ),
            );
          },
        ),
      ),
    );
  }
}
