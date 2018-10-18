import 'dart:async';

import 'package:fluntitled/models/error.dart';
import 'package:fluntitled/models/login_detail.dart';
import 'package:fluntitled/models/user.dart';


class AuthService {
  Future<User> loginUser(LoginDetail detail) async {
    await Future.delayed(Duration(seconds: 1)); //simulate network delay
    if (detail.email == 'johndoe@acme.com' && detail.password == '1234') {
      return User(
          id: 1,
          name: 'John Doe',
          email: 'johndoe@acme.com',
          age: 26,
          profilePic: 'john_doe.png');
    } else {
      throw MyError(message: 'login details incorrect.');
    }
  }
}
