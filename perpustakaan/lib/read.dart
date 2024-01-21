import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      appBar: AppBar(
        title: Text("perpustakaan"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, index) {
              return Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: ListTile(
                  title: Text("Nama Buku"),
                  subtitle: Text("Kode-Pembuat"),
                ),
              );
            }),
      ),
      //floatingActionButton: FloatingActionButton(
      //backgroundColor: Colors.purple, child: Icon(icon)),
    );
  }
}
