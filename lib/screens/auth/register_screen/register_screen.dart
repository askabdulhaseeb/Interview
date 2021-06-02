import 'package:flutter/material.dart';
import 'package:interview/models/app_user.dart';
import 'package:interview/providers/user_provider.dart';
import 'package:interview/screens/auth/register_screen/login_line.dart';
import 'package:provider/provider.dart';
import '../widgets/valideEmailTextFormField.dart';
import '../widgets/valideNameTextFormField.dart';
import '../widgets/validePasswordTextFormField.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
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
            ValideNameTextFormField(name: _name),
            ValideEmailTextFormField(email: _email),
            ValidePasswordTextFormField(password: _password),
            ElevatedButton(
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  AppUser _user = AppUser(
                    name: _name.text.trim(),
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  );
                  Provider.of<AppUserProvider>(context, listen: false)
                      .appNewUser(_user);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Register'),
            ),
            const SizedBox(height: 12),
            LoginLine(),
          ],
        ),
      ),
    );
  }
}
