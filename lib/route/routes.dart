import 'package:a_to_d_assignemt/presentation/screens/detailsScreen.dart';
import 'package:a_to_d_assignemt/presentation/screens/doneSignUp.dart';
import 'package:a_to_d_assignemt/presentation/screens/home.dart';
import 'package:a_to_d_assignemt/presentation/screens/signIn.dart';
import 'package:a_to_d_assignemt/presentation/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRout {
  Route onGeneratedRout(RouteSettings route) {
    Map arguments = route.arguments as Map;
    print(arguments);
    switch (route.name) {
      case '/home':
        return MaterialPageRoute(
            builder: (context) => HomePage(
                  cityId: arguments['cityId'],
                  tocken: arguments['token'],
                ));
      case '/signUp':
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/signUpDone':
        return MaterialPageRoute(builder: (context) => SignUpDone());
      case '/details':
        return MaterialPageRoute(builder: (context) => Details());
      default:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
    }
  }
}
