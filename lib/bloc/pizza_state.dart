part of 'pizza_bloc.dart';

sealed class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

final class PizzaInitial extends PizzaState {}

final class PizzaLoaded extends PizzaState {
  final List<PizzaModel> pizza;
  const PizzaLoaded({required this.pizza});

  @override
  List<Object> get props => [pizza];
}
