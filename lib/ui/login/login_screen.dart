import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/login/login_cubit.dart';
import 'package:on_boarding/cubit/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).SignIn(
                login: 'login',
                password: 'password',
              );
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).LogOutUser();
            },
            child: const Text('Log out'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).SingUp(
                userName: 'userName',
                login: 'login',
                password: 'password',
              );
            },
            child: const Text('Registration'),
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is initialState) {
                return const Center(
                  child: Text('Hali hech narsa bolmadi'),
                );
              }
              if (state is SingInState) {
                return const Center(
                  child: Text('Foydalanuvchi sign in qilayabdi'),
                );
              }
              if (state is SingUpState) {
                return const Center(
                  child: Text('Foydalanuvchi sign up qilayabdi'),
                );
              }
              if (state is LoggedState) {
                return const Center(
                  child: Text('Foydalanuvchi mufaqiyatli o`tdi'),
                );
              }
              if (state is RegistarErrorState) {
                return const Center(
                  child: Text('bu error'),
                );
              }

              if (state is UnAuthenticatedState) {
                return const Center(
                  child: Text('Log out'),
                );
              }
              return const Center(
                child: Text('Nimadur boldi'),
              );
            },
          ),
        ],
      ),
    );
  }
}
