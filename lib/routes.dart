import 'package:flutter/cupertino.dart';
import 'package:uni_x/pages/home_page.dart';
import 'package:uni_x/pages/login_page.dart';

Object router(BuildContext context) {
  return {
    '/login': (BuildContext context) => LoginPage(),
    '/home': (BuildContext context) => HomePage()
  };
}
