import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/counter/counter_cubit.dart';
import 'package:on_boarding/ui/counter/counter_screen_two.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CounterTwoScreen();
                  },
                ));
              },
              icon: const Icon(Icons.skip_next_sharp))
        ],
      ),
      body: BlocBuilder<CounterCubit, int>(builder: (context, state) {
        print(state);
        return Center(
          child: Column(
            children: [
              Text('$state'),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().dicrement();
                  },
                  child: Text('$state'))
            ],
          ),
        );
      }),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Icon(Icons.plus_one)),
        ],
      ),
    );
  }
}
