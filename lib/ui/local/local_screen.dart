import 'package:flutter/material.dart';
import 'package:on_boarding/servise/local_db_servise.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Hello world ')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        LocalDataBase().createDatabase();
      }),
    );
  }
}
