import 'dart:async';
import 'package:fluntitled/screens/myhome_screen.dart';
import 'package:flutter/material.dart';

import 'package:fluntitled/models/login_detail.dart';
import 'package:fluntitled/models/user.dart';
import 'package:fluntitled/services/auth_service.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends Object with Validators {
  AuthService authService;
  BuildContext _context;

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isAuthenticated = BehaviorSubject<bool>();
  final loadingSubject = BehaviorSubject<bool>(seedValue: false);
  final loginSubject = BehaviorSubject<Null>(seedValue: null);
  final currentUserSubject = BehaviorSubject<User>(seedValue: null);

  // retrieve data from stream

  Stream<String> get emailStream    => _email.stream;//.transform(validateEmail);
  Stream<String> get passwordStream => _password.stream;//.transform(validatePassword);
  Stream<bool>   get submitValid => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);
  Stream<bool>   get isAuthenticated => _isAuthenticated.stream;
  Stream<bool>   get loading => loadingSubject.stream;
  Stream<User> get currentUser => currentUserSubject.stream;

  void Function(String) get emailChanged => _email.sink.add;
  void Function(String) get passwordChanged => _password.sink.add;

  void Function(BuildContext) get submitLogin => (context) {
    this.setContext(context);
    loginSubject.add(null);
  };


  AuthBloc({this.authService}) {

    Stream<LoginDetail> loginDetailStream = Observable.combineLatest2(
        emailStream, passwordStream, (email, password) {
      return LoginDetail(email: email, password: password);
    });


    Stream<User> loggedIn = Observable(loginSubject.stream)
        .withLatestFrom(loginDetailStream, (_, loginDetail) {
      return loginDetail;
    }).flatMap((loginDetail) {
      return Observable.fromFuture(authService.loginUser(loginDetail)).doOnListen((){
        loadingSubject.add(true);
      }).doOnDone((){
        loadingSubject.add(false);
      });
    });

    loggedIn.listen((User user) {
      currentUserSubject.add(user);
      Navigator.push(
        _context,
        new MaterialPageRoute(builder: (context) => MyHomePage(title: "我的收藏",)),
      );
    }, onError: (error) {
      Scaffold.of(_context).showSnackBar(new SnackBar(
        content: new Text("Username or password incorrect"),
      ));
    });



  }
  submit() {
    final validEmail    = _email.value;
    final validPassword = _password.value;
    _isAuthenticated.sink.add(true);
    print('$validEmail and $validPassword');
  }


  dispose() {
    _email.close();
    _password.close();
  }
  setContext(BuildContext context){
    _context = context;
  }
}