import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/controllers/home_controller.dart';
import 'package:task_l4/globals.dart' as globals ;

void main() {
  runApp(const App()); 
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //init database
    globals.db.initDB(); 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context)=> HomeController().Homeview(),
        'auth.signup': (context)=> AuthController().signUpView(),
        'auth.login': (context)=> AuthController().loginView(),
        'auth.loginWithNumber': (context)=> AuthController().loginWithNumberView(),
        'auth.recoverAccount': (context)=> AuthController().recoverAccountView(),
        'auth.passwordChanged': (context)=> AuthController().passwordChangedView(),
      },
    );
  }
}
