import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interview/models/app_user.dart';
import 'package:interview/providers/user_provider.dart';
import 'package:interview/screens/auth/login_screen/register_line.dart';
import 'package:interview/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/valideEmailTextFormField.dart';
import '../widgets/validePasswordTextFormField.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          children: [
            const SizedBox(height: 200),
            ValideEmailTextFormField(email: _email),
            ValidePasswordTextFormField(password: _password),
            ElevatedButton(
              onPressed: () {
                AppUser? _user =
                    Provider.of<AppUserProvider>(context, listen: false).user;
                if (_user != null) {
                  if (_email.text.trim() == _user.email &&
                      _password.text.trim() == _user.password) {
                    Navigator.of(context)
                        .pushReplacementNamed(HomeScreen.routeName);
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Invalid email OR password',
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.red,
                    );
                  }
                } else {
                  Fluttertoast.showToast(
                    msg: 'Place register yourself',
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                  );
                }
              },
              child: Text('Login'),
            ),
            const SizedBox(height: 12),
            RegisterLine(),
          ],
        ),
      ),
    );
  }
}
