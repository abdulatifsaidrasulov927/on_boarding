import 'package:flutter/material.dart';
import 'package:on_boarding/ui/counter/counter_page.dart';
import 'package:on_boarding/ui/login/login_screen.dart';
import 'package:on_boarding/ui/user/user_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const UsrePage();
                  }));
                },
                child: const Text('UserPage')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                child: const Text('LoginScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CounterPage();
                  }));
                },
                child: const Text('CounterPage')),
          ],
        ),
      ),
    );
  }
}
