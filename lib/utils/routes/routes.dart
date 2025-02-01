import 'package:flutter/material.dart';
import 'package:login_profile_app/utils/routes/route_name.dart';
import 'package:login_profile_app/view/home.dart';
import 'package:login_profile_app/view/login_page.dart';
class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomePage(),);
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginView(),);
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        },);
    }
  }
}