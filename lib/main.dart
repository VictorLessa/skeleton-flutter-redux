import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:uni_x/routes.dart';
import 'package:uni_x/pages/login_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni_x/redux/app_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: appStore,
        child: MaterialApp(
          debugShowCheckedModeBanner: true,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
          routes: router(context),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }

  Widget _introScreen() {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffED213A), Color(0xff93291E)],
          ),
          navigateAfterSeconds: LoginPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
