import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:e_lorry/admin/appUsers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userDetails extends StatefulWidget {
  String name;
  String uid;
  String pw;
  String dept;
  String docID;


  userDetails({

    this.name,
    this.uid,
    this.pw,
    this.dept,
    this.docID,
  });
  @override
  _userDetailsState createState() => _userDetailsState();
}

class _userDetailsState extends State<userDetails> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _name;
  String _uid;
  String _pw;
  String _dept;
  final db = Firestore.instance;

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
      _updateData();
    }
  }

  _updateData() async {
    await Firestore.instance
        .collection('userUID')
        .document(widget.docID)
        .updateData({
      'name': _name,
      'uid': _uid,
      'pw': _pw,
      'dept': _dept,

    }).then((result) =>

        _showPopUp());
  }

  void _showPopUp() {
    // flutter defined function
    final form = formKey.currentState;
    form.reset();
    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Your request has been sent"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Truck Details"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: new Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              new Container(
                height: 200.0,
                decoration: new BoxDecoration(
                  color: Colors.grey.withAlpha(50),
                  borderRadius: new BorderRadius.only(
                    bottomRight: new Radius.circular(20.0),
                    bottomLeft: new Radius.circular(20.0),
                  ),
                ),
              ),
              new Card(child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:MainAxisSize.min,
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DropDownFormField(
                            titleText: 'Access level',
                            hintText: widget.dept,
                            value: _dept,
                            validator: (value) {
                              if (value == null) {
                                return 'Required';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _dept = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _dept = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Manager",
                                "value": "Manager",
                              },
                              {
                                "display": "Accounts",
                                "value": "Accounts",
                              },
                              {
                                "display": "Mechanic",
                                "value": "Mechanic",
                              },

                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay'
                                ),
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.red),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    labelText: 'Name',
                                    labelStyle: TextStyle(
                                        fontSize: 11
                                    )
                                ),
                                initialValue: widget.name,
                                validator: (val) =>
                                val.isEmpty  ? null : null,
                                onSaved: (val) => _name = val,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay'
                                ),
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.red),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    labelText: 'User ID',
                                    labelStyle: TextStyle(
                                        fontSize: 11
                                    )
                                ),
                                initialValue: widget.uid,
                                validator: (val) =>
                                val.isEmpty  ? null : null,
                                onSaved: (val) => _uid = val,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'SFUIDisplay'
                                ),
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.red),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        fontSize: 11
                                    )
                                ),
                                initialValue: widget.pw,
                                validator: (val) =>
                                val.isEmpty  ? null : null,
                                onSaved: (val) => _pw = val,
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 0),
                            child: MaterialButton(
                              onPressed: _submitCommand,
                              child: Text('Update',
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

                          FlatButton(
                            color: Colors.deepPurple[900],
                            onPressed: () async {
                              await db
                                  .collection('userID')
                                  .document(widget.docID)
                                  .delete();

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Deleted"),
                                      content: Text("Removed from Database"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).push(new CupertinoPageRoute(
                                                builder: (context) => AppUsers()));
                                          },
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text('Delete User',style: TextStyle(color: Colors.white, fontSize: 10.0),),
                              ],
                            ),
                          ),




                        ],
                      ),
                    ),

                  ],
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}