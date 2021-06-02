import 'package:flutter/material.dart';
import 'package:interview/models/app_user.dart';

class AppUserProvider extends ChangeNotifier {
  AppUser? user;
  appNewUser(AppUser myUser) {
    user = myUser;
    notifyListeners();
  }
}
