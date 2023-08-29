part of 'pizza_bloc.dart';

sealed class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}

class loadPizzaCounter extends PizzaEvent {}

class AddedPizza extends PizzaEvent {
  final PizzaModel pizza;

  const AddedPizza({required this.pizza});

  @override
  List<Object> get props => [pizza];
}

class RemovePizza extends PizzaEvent {
  final PizzaModel pizza;

  const RemovePizza({required this.pizza});

  @override
  List<Object> get props => [pizza];
}
