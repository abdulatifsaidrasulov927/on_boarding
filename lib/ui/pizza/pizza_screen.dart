import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/bloc/pizza_bloc.dart';
import 'package:on_boarding/model/pizza/pizza_model.dart';

class PizzaCounterScreen extends StatefulWidget {
  const PizzaCounterScreen({super.key});

  @override
  State<PizzaCounterScreen> createState() => _PizzaCounterScreenState();
}

class _PizzaCounterScreenState extends State<PizzaCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Counter'),
        backgroundColor: Colors.orange[800],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(builder: (context, state) {
          if (state is PizzaInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PizzaLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.pizza.length}',
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      ...List.generate(state.pizza.length, (index) {
                        Random random = Random();
                        return Positioned(
                          left: random.nextInt(250).toDouble(),
                          top: random.nextInt(400).toDouble(),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(state.pizza[index].image),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('error'),
            );
          }
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context
                  .read<PizzaBloc>()
                  .add(AddedPizza(pizza: PizzaModel.pizzasModel[0]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(Icons.local_pizza_outlined),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context
                  .read<PizzaBloc>()
                  .add(RemovePizza(pizza: PizzaModel.pizzasModel[0]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(Icons.remove),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context
                  .read<PizzaBloc>()
                  .add(AddedPizza(pizza: PizzaModel.pizzasModel[1]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(Icons.local_pizza),
          ),
          FloatingActionButton(
            onPressed: () {
              context
                  .read<PizzaBloc>()
                  .add(RemovePizza(pizza: PizzaModel.pizzasModel[1]));
            },
            backgroundColor: Colors.orange[800],
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
