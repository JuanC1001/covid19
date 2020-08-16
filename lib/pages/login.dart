import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider.dart';

class login extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => login(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<login> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;
  String _password;
  bool _isLoggIn = false;
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: SimpleDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
    new Future.delayed(new Duration(seconds:2), () {
      Navigator.pop(context); //pop dialog
      _login();
    });
  }
  _login() async {
    if (_isLoggIn) return;
    setState(() {
      _isLoggIn = true;
    });
    final form = keyForm.currentState;
    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isLoggIn = false;
      });
      return;
    }
    form.save();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Ingresando'),
        duration: Duration(seconds: 5),
      ));
      //print(user.email);

      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.message),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _scaffoldKey.currentState.hideCurrentSnackBar();
          },
        ),
      ));
    } finally {
      setState(() {
        _isLoggIn = false;
      });
    }
  }

  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    var myProvider = Provider.of<MyProvider>(context);
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: Column(
        children: <Widget>[
          Flexible(
            child: Center(
              child: Image.asset('images/msplogo.jpg', width: 200, height: 200),
            ),
            //fit: FlexFit.tight,
            flex: 4,
          ),
          Container(

            margin: new EdgeInsets.only(
                left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
            padding: EdgeInsets.all(2),
            child: new Form(
              key: keyForm,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    child: TextFormField(
                      controller: emailCtrl,
                      style: TextStyle(fontSize: 15),
                      validator: validateEmail,
                      decoration: new InputDecoration(
                        isDense: true,
                        //contentPadding: EdgeInsets.all(5),
                        //errorStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(),
                        prefixIcon:
                        Icon(Icons.email, color: Color(0xFF203573)),
                        labelText: 'Correo electrónico',
                      ),
                      onSaved: (validateEmail) {
                        setState(() {
                          _email = validateEmail;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: passwordCtrl,
                      obscureText: true,
                      style: TextStyle(fontSize: 15),
                      validator: validatePassword,
                      decoration: new InputDecoration(
                        isDense: true,
                        //contentPadding: EdgeInsets.all(5),
                        errorStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(),
                        prefixIcon:
                        Icon(Icons.vpn_key, color: Color(0xFF203573)),
                        labelText: 'Contraseña',
                      ),
                      onSaved: (validatePassword) {
                        setState(() {
                          _password = validatePassword;
                        });
                      },
                    ),
                  ),
                  Container(
                    //flex: 1,
                    //margin: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 20.0, top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                            child: Container(
                              padding: EdgeInsets.only(left: 2.0, right: 2.0, top: 0, bottom: 10),
                              margin: EdgeInsets.only(left: 15.0),
                              child: Text(
                                "¿Olvidó su contraseña?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            onTap: () => Navigator.pushNamed(context, '/home')),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      //new CircularProgressIndicator();
                      _onLoading();
                      myProvider.miemail = _email;
                      //_login();
                    },
                    color: Colors.blueAccent,
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(2, 13, 2, 13),
                      alignment: Alignment.center,
                      child: Text("INICIAR SESIÓN",
                          style: TextStyle(
                              color: Colors.white,
                              //fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),


          Flexible(
            flex: 2,
            //margin: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 20.0, top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 15.0, top: 0, bottom: 10),
                      margin: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "ACERCA DE",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/home')),
              ],
            ),
          ),




        ],
      ),
    );
  }

  String validatePassword(String value) {
    //print("valorrr $value passsword ${passwordCtrl.text}");
    if (value.length == 0) {
      return "La contaseña es necesaria";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }
}





