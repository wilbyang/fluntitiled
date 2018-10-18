
import 'package:fluntitled/blocs/provider.dart';
import 'package:fluntitled/screens/login_screen.dart';
import 'package:fluntitled/screens/myhome_screen.dart';
import 'package:fluntitled/screens/register_screen.dart';
import 'package:fluntitled/screens/savings_screen.dart';
import 'package:fluntitled/screens/splash_screen.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => new _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: login(context),
        title: new Text('Welcome In SplashScreen',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=> print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }

  Widget login(BuildContext context) {

    return Provider(
      child: MaterialApp(
        title: 'Log Me In!',
        home: Scaffold(
          body: LoginScreen(),
        ),)
    );

  }/*
  final Map<String, WidgetBuilder> anonymousRoutes = {
    '/': (context) => new LoginScreen(), // default for anon
    '/register': (context) => new RegisterScreen(),
  };

  final Map<String, WidgetBuilder> authenticatedRoutes = {
    '/': (context) => new MyHomePage(title: "xxhh",), // default for logged in
    '/savings': (context) => new SavingsScreen(),
    // ...
  };
  Navigator _buildNavigator(bool isAuthenticated) {
    // different route tree and different default route depending on auth state
    final routes = isAuthenticated ? authenticatedRoutes : anonymousRoutes;

    return Navigator(
      key: ValueKey(isAuthenticated),
      onGenerateRoute: (RouteSettings settings) {
        final name = settings.name;
        return MaterialPageRoute(
          builder: routes[name],
          settings: settings,
        );
      },
      onUnknownRoute: (RouteSettings settings) {
        throw Exception('unknown route');
      },
    );
  }*/
}



