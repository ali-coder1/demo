import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Anyway (Push)",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your Info:"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(_login , style: TextStyle(fontSize: 20.0)),
                Text(_password, style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String _login = "";
  String _password = "";

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void _loginBtn() {
    setState(() {
      if (_userController.text.trim().isNotEmpty &&
          _passController.text.trim().isNotEmpty) {
        _login = "Welcom ${_userController.text}";
        _password = "Your Password is ${_passController.text}";
      } else {
        _login = "Sorry!! Wrong Info";
      }
      _alertDialog();
    });
  }

  void _clearBtn() {
    setState(() {
      _userController.clear();
      _passController.clear();
      _login = "";
      _password = "";
    });
    print("Cleared!!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            Image.asset("images/userbackground.png"),
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                      controller: _userController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "User name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepPurple),
                      controller: _passController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: "Password",
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Container(
                            child: RaisedButton(
                              onPressed: _loginBtn,
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              child: Text("Login"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60.0),
                          child: Container(
                            child: RaisedButton(
                              onPressed: _clearBtn,
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              child: Text("Clear"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
