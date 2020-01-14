import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user/user.dart';
import 'admin/Admin.dart';
import 'manager/manager.dart';
import 'mechanic/mech.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  List<Color> _backgroundColor;
  Color _iconColor;
  Color _textColor;
  List<Color> _actionContainerColor;
  Color _borderContainer;
  bool colorSwitched = false;
  var logoImage;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //We have two private fields here
  String _email;
  String _password;
  String name1;
  String pw1;
  String name2;
  String pw2;
  String name3;
  String pw3;
  String name4;
  String pw4;
  String avatar;
  String id;


  Future getMechanic() async {
    var snapshot = Firestore.instance.collection('users')
        .document('user1')
        .get();
    snapshot.then((data) {
      setState(() {
        name1 = data['name'];
        pw1 = data['password'];
      });
    });
  }

  Future getAccounts() async {
    var snapshot = Firestore.instance.collection('users')
        .document('user2')
        .get();
    snapshot.then((data) {
      setState(() {
        name2 = data['name'];
        pw2 = data['password'];
      });
    });
  }
  Future getManager() async {
    var snapshot = Firestore.instance.collection('users')
        .document('user3')
        .get();
    snapshot.then((data) {
      setState(() {
        name3 = data['name'];
        pw3 = data['password'];
      });
    });
  }

  Future getAdmin() async {
    var snapshot = Firestore.instance.collection('users')
        .document('user4')
        .get();
    snapshot.then((data) {
      setState(() {
        name4 = data['name'];
        pw4 = data['password'];
      });
    });
  }

  void _submitCommand() {
    //get state of our Form
    final form = formKey.currentState;

    //`validate()` validates every FormField that is a descendant of this Form,
    // and returns true if there are no errors.
    if (form.validate()) {
      //`save()` Saves every FormField that is a descendant of this Form.
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _loginCommand();
    }
  }



  _loginCommand() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', _email);
    prefs.setString('avatar', avatar);
    prefs.setString('id', id);
    // Show login details in snackbar
    if(_email == name2 && _password == pw2 ) {
      _messaging.subscribeToTopic('puppies');
      _messaging.subscribeToTopic('all');
      Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new User()
      ));
      setState(() {
       avatar = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo3xVVjJb0vuqRDvdSPemMzram7zzRRv4RFpy8JcGDNkjE3n6z&s";
       id = "user2";

      });
    }
    if(_email == name1 && _password == pw1 ) {
      _messaging.subscribeToTopic('mech');
      _messaging.subscribeToTopic('all');
      Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new Mech()
      ));
      setState(() {
        avatar = "https://static.thenounproject.com/png/215117-200.png";
        id = "user1";
      });
    }
    if(_email == name3 && _password == pw3 ) {
      _messaging.subscribeToTopic('manager');
      _messaging.subscribeToTopic('all');
      Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new Manager()
      ));
      setState(() {
        avatar = "data:image/png;base64,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";
        id = "user3";
      });
    }
    if(_email == name4 && _password == pw4 ) {
      Navigator.of(context).push(new CupertinoPageRoute(
          builder: (BuildContext context) => new Admin()
      ));
      setState(() {
        avatar = "data:image/png;base64,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";
        id = "user4";
      });
    }
    else {
      final snackbar = SnackBar(
        content: Text('invallid login details'),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  void changeTheme() async {
    if (colorSwitched) {
      setState(() {
        logoImage = 'assets/wallet.png';
        _backgroundColor = [
          Color.fromRGBO(252, 214, 0, 1),
          Color.fromRGBO(251, 207, 6, 1),
          Color.fromRGBO(250, 197, 16, 1),
          Color.fromRGBO(249, 161, 28, 1),
        ];
        _iconColor = Colors.white;
        _textColor = Color.fromRGBO(253, 211, 4, 1);
        _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
        _actionContainerColor = [
          Color.fromRGBO(47, 75, 110, 1),
          Color.fromRGBO(43, 71, 105, 1),
          Color.fromRGBO(39, 64, 97, 1),
          Color.fromRGBO(34, 58, 90, 1),
        ];
      });
    } else {
      setState(() {
        logoImage = 'assets/images/wallet_logo.png';
        _borderContainer = Color.fromRGBO(252, 233, 187, 1);
        _backgroundColor = [
          Color.fromRGBO(249, 249, 249, 1),
          Color.fromRGBO(241, 241, 241, 1),
          Color.fromRGBO(233, 233, 233, 1),
          Color.fromRGBO(222, 222, 222, 1),
        ];
        _iconColor = Colors.black;
        _textColor = Colors.black;
        _actionContainerColor = [
          Color.fromRGBO(255, 212, 61, 1),
          Color.fromRGBO(255, 212, 55, 1),
          Color.fromRGBO(255, 211, 48, 1),
          Color.fromRGBO(255, 211, 43, 1),
        ];
      });
    }
  }


  @override
  void initState() {
    changeTheme();
    getMechanic();
    getAccounts();
    getAdmin();
    getManager();
    super.initState();
    _messaging.getToken().then((token) {
      print(token);
    });
    _messaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
    );


    setState(() {
      logoImage = 'assets/logo.png';
      _borderContainer = Color.fromRGBO(252, 233, 187, 1);
      _backgroundColor = [
        Color.fromRGBO(255, 180, 0, 1),
        Color.fromRGBO(255, 201, 0, 1),
        Color.fromRGBO(255, 206, 26, 1),
        Color.fromRGBO(255, 215, 118, 1),
      ];
      _iconColor = Colors.white;
      _textColor = Colors.white;
      _actionContainerColor = [
        Color.fromRGBO(199, 21, 21, 1),
        Color.fromRGBO(239, 36, 36, 1),
        Color.fromRGBO(247, 60, 60, 1),
        Color.fromRGBO(255, 36, 36, 1),
      ];
    });
  }

  final FirebaseMessaging _messaging = FirebaseMessaging();


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onLongPress: () {},
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Image.asset(
                    logoImage,
                    fit: BoxFit.contain,
                    height: 200.0,
                    width: 300.0,
                  ),

                  Column(
                    children: <Widget>[
                      Container(
                        height: 450.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                              color: Colors.red[900],

                                ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                    child: Container(
                                      child: TextFormField(
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'SFUIDisplay'
                                        ),
                                        decoration: InputDecoration(
                                            errorStyle: TextStyle(color: Colors.white),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.1),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: new BorderSide(color: Colors.white70),
                                            ),
                                            labelText: 'Username',
                                            prefixIcon: Icon(Icons.person_outline),
                                            labelStyle: TextStyle(
                                                fontSize: 15
                                            )
                                        ),
                                        validator: (val) =>
                                        val.isEmpty  ? 'Enter a valid Username' : null,
                                        onSaved: (val) => _email = val,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                    child: Container(
                                      child: TextFormField(
                                        obscureText: true,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'SFUIDisplay'
                                        ),
                                        decoration: InputDecoration(
                                            errorStyle: TextStyle(color: Colors.white),
                                            filled: true,
                                            fillColor: Colors.white.withOpacity(0.1),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                              borderSide: new BorderSide(color: Colors.white70),
                                            ),
                                            labelText: 'Password',
                                            prefixIcon: Icon(Icons.lock_outline),
                                            labelStyle: TextStyle(
                                                fontSize: 15
                                            )
                                        ),
                                        validator: (val) =>
                                        val.length < 4 ? 'Your password is too Password too short..' : null,
                                        onSaved: (val) => _password = val,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(70, 10, 70, 0),
                                    child: MaterialButton(
                                      onPressed: _submitCommand,
                                      child: Text('SIGN IN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SFUIDisplay',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Colors.white,
                                      elevation: 16.0,
                                      minWidth: 400,
                                      height: 50,
                                      textColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                    ),
                                  ),




                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}