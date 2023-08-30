import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:on_boarding/model/pizza/pizza_model.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<loadPizzaCounter>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(const PizzaLoaded(pizza: <PizzaModel>[]));
    });

    on<AddedPizza>((event, emit) {
      if (state is PizzaLoaded) {
        final state = this.state as PizzaLoaded;

        emit(
          PizzaLoaded(pizza: List.from(state.pizza)..add(event.pizza)),
        );
      }
    });
    on<RemovePizza>((event, emit) {
      if (state is PizzaLoaded) {
        final state = this.state as PizzaLoaded;
        emit(
          PizzaLoaded(pizza: List.from(state.pizza)..remove(event.pizza)),
        );
      }
    });
  }
}
