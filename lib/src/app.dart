import 'package:flutter/material.dart';
import 'screens/loginScreen.dart';
import 'bloc/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: "Login form using Bloc",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Bloc login form'),
          ),
          body: LoginScreen(),
        ),
      ),
    );
  }
}
