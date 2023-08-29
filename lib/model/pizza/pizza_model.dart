import 'package:equatable/equatable.dart';
import 'package:on_boarding/utils/images.dart';

class PizzaModel extends Equatable {
  final int id;
  final String name;
  final String image;

  PizzaModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<PizzaModel> pizzasModel = [
    PizzaModel(
      id: 0,
      name: 'Pizza',
      image: AppImages.pizza,
    ),
    PizzaModel(
      id: 2,
      name: 'PizzaPeporony',
      image: AppImages.pizzaPeporony,
    ),
  ];
}
