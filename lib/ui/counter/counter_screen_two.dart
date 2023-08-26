import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/counter/counter_cubit.dart';

class CounterTwoScreen extends StatelessWidget {
  const CounterTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        print(state);
        return Center(
          child: Text('$state'),
        );
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().increment();
          },
          child: const Icon(Icons.plus_one)),
    );
  }
}
