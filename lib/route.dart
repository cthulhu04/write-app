import 'package:flutter/material.dart';
import 'package:write_app/screens/screens.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'register':
      return MaterialPageRoute(builder: (context) => SignInAndSignUpScreen());

    case 'login':
      return MaterialPageRoute(builder: (context) => UserScreen());

    case 'new document':
      return MaterialPageRoute(builder: (context) => NewDocumentScreen());

    default:
      return MaterialPageRoute(builder: (context) => SignInAndSignUpScreen());
  }
}
