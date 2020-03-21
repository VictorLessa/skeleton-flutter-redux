import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni_x/redux/app_actions.dart';
import 'package:uni_x/redux/app_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  homeApp() {
    return Container(
      child: Center(
        child: StoreConnector<AppState, String>(
          converter: (store) => store.state.details['username'],
          builder: (BuildContext context, user) {
            return Text(user);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102733),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 116, 169, .5),
        title: Text('Title'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.crop_free,
              color: Colors.white,
              size: 25.0,
            ),
          )
        ],
      ),
      body: homeApp(),
    );
  }
}
