import 'package:flutter/material.dart';
import 'package:on_boarding/model/user_model/user_model.dart';
import 'package:on_boarding/servise/local_db_servise.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController job = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          TextField(
            controller: firstName,
            decoration: const InputDecoration(
                label: Text('first name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: lastName,
            decoration: const InputDecoration(
                label: Text('last name'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
          TextField(
            controller: job,
            decoration: const InputDecoration(
                label: Text('job title'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
          TextField(
            controller: age,
            decoration: const InputDecoration(
                label: Text('age'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
          TextField(
            controller: gender,
            decoration: const InputDecoration(
                label: Text('gender'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)))),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        LocalDatabase().addUser(
          UserModel(
            firstName: firstName.text,
            lastName: lastName.text,
            age: age.text,
            gender: gender.text,
            job: job.text,
          ),
        );
      }),
    );
  }
}
