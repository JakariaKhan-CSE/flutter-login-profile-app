import 'package:flutter/material.dart';
import 'package:login_profile_app/utils/routes/route_name.dart';
import 'package:login_profile_app/utils/routes/routes.dart';
import 'package:login_profile_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthViewModel(),)
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const LoginScreen(), // no need to use home
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,

      ),
    );
  }
}
