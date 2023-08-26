import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/counter/counter_cubit.dart';
import 'package:on_boarding/cubit/login/login_cubit.dart';
import 'package:on_boarding/cubit/user/user_cubit.dart';
import 'package:on_boarding/ui/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
// import 'package:flutter/material.dart';
// import 'package:on_boarding/phone_vali.dart/home_screen.dart';

// void main() => runApp(const App());

// void dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'Helvetica Neue'),
//       home: Home(),
//     );
//   }
// }

