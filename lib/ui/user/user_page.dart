import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:on_boarding/cubit/counter_cubit.dart';
import 'package:on_boarding/cubit/user/user_cubit.dart';
import 'package:on_boarding/cubit/user/user_state.dart';

class UsrePage extends StatefulWidget {
  const UsrePage({super.key});

  @override
  State<UsrePage> createState() => _UsrePageState();
}

class _UsrePageState extends State<UsrePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();

  // @override
  // void initState() {
  //   // UserModel userModel = BlocProvider.of<UserCubit>(context).state;
  //   // usernameController.text = userModel.name;
  //   // userAgeController.text = userModel.age.toString();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return Column(
          children: [
            TextField(
              onChanged: (value) {
                context.read<UserCubit>().updateName(value);
              },
              decoration: InputDecoration(
                hintText: 'name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19),
                  borderSide: const BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                      width: 2,
                      strokeAlign: 12),
                  gapPadding: 10,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                context.read<UserCubit>().updateAge(int.parse(value));
              },
              decoration: InputDecoration(
                hintText: 'age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19),
                  borderSide: const BorderSide(
                      color: Colors.red,
                      style: BorderStyle.solid,
                      width: 2,
                      strokeAlign: 12),
                ),
              ),
            ),
            Center(child: Text('name ${state.name}')),
            Center(child: Text('age ${state.age}'))
          ],
        );
      }),
    );
  }
}
