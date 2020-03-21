import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni_x/services/Authenticate.dart';
import 'package:uni_x/redux/app_actions.dart';
import 'package:uni_x/redux/app_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _loading;
  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  Widget _input(String labelText, controller, bool obscure) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white, width: 1.0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.white, width: 1.0)),
        labelText: labelText,
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Insira uma valor';
        }
        return null;
      },
    );
  }

  Widget _button(BuildContext context, title) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.white,
        onPressed: () async {
          try {
            var response = await Authenticate()
                .signIn({"email": "victordsgnr@gmail.com", "password": "123"});
            StoreProvider.of<AppState>(context)
                .dispatch({"type": SaveUser(), "data": response});
            Navigator.pushNamed(context, '/home');
          } catch (e) {
            dialog(context, e.message);
          }
        },
        child: _loading
            ? SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ),
                height: 20.0,
                width: 20.0,
              )
            : Text(title),
      ),
    );
  }

  Future dialog(BuildContext context, message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ops..'-'"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Fechar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF102733),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _input('E-mail', _emailController, false),
                        SizedBox(height: 20.0),
                        _input('Senha', _passwordController, true),
                        SizedBox(
                          height: 20.0,
                        ),
                        _button(context, 'Entrar')
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
