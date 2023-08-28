import 'package:flutter/material.dart';
import 'package:on_boarding/model/mind_model.dart';
import 'package:on_boarding/servise/local_db_servise.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  TextEditingController _aouthor = TextEditingController();
  TextEditingController _mind = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          TextField(
            controller: _aouthor,
            decoration: const InputDecoration(
                label: Text('Aouthor'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _mind,
            decoration: const InputDecoration(
                label: Text('Mind'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        LocalDatabase()
            .addMind(MindModel(author: _aouthor.text, mind: _mind.text));
      }),
    );
  }
}
