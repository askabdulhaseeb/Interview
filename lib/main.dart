import 'package:flutter/material.dart';
import 'package:interview/providers/user_provider.dart';
import 'package:interview/screens/auth/login_screen/login_screen.dart';
import 'package:interview/screens/auth/register_screen/login_line.dart';
import 'package:interview/screens/auth/register_screen/register_screen.dart';
import 'package:interview/screens/home_screen/home_screen.dart';
import 'package:interview/screens/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppUserProvider(),
      child: MaterialApp(
        title: 'Interview',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          RegisterScreen.routeName: (ctx) => RegisterScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
        },
      ),
    );
  }
}
