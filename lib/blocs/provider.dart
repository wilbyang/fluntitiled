import 'package:fluntitled/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'auth_bloc.dart';

class Provider extends InheritedWidget {

  final bloc = AuthBloc(authService: AuthService());

  Provider({Key key, Widget child})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

}