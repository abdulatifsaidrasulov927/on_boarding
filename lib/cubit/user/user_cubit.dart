import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(
          UserState(
            age: 0,
            name: '',
          ),
        );

  updateName(String newName) {
    emit(state.copyWith(name: newName));
  }

  updateAge(int newAge) {
    emit(state.copyWith(age: newAge));
  }
}
