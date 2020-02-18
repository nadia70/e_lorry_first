import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../chat.dart';
import 'Forms.dart';

class Mech extends StatefulWidget {
  @override
  _MechState createState() => _MechState();
}

class _MechState extends State<Mech> {
  Future getUsers() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("trucks").getDocuments();
    return qn.documents;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("SELECT TRUCK"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        actions: <Widget>[

          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.chat,
                color: Colors.white,)
                  , onPressed: (){
                    Navigator.of(context).push(new CupertinoPageRoute(
                        builder: (BuildContext context) => new Chat()
                    ));
                  }),

            ],
          )
        ],
      ),

      body: Container(
        child: new Column(
          children: <Widget>[

            new Flexible(
              child: FutureBuilder(
                  future: getUsers(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading... Please wait"),
                      );
                    }if (snapshot.data == null){
                      return Center(
                          child: Text("The are no saved trucks"),);
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return new GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ServiceForm(

                                truckNumber: snapshot.data[index].data["plate"],
                                driverName: snapshot.data[index].data["driver"],
                                driverNumber: snapshot.data[index].data["phone"],
                                driverID: snapshot.data[index].data["ID"],
                                turnboy: snapshot.data[index].data["turnboy"],
                                truckType: snapshot.data[index].data["type"],


                              )));
                            },
                            child: new Card(
                              child: Stack(
                                alignment: FractionalOffset.topLeft,
                                children: <Widget>[
                                  new ListTile(
                                    leading: new CircleAvatar(
                                      backgroundColor: Colors.red[900],
                                      child: new Icon(Icons.directions_car)
                                    ),
                                    title: new Text("${snapshot.data[index].data["plate"]}",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.0,
                                          color: Colors.red[900]),),
                                    subtitle: new Text("Driver : ${snapshot.data[index].data["driver"]}",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12.0,
                                          color: Colors.grey),),
                                  ),

                                ],
                              ),
                            ),
                          );

                        },
                      );

                    }
                  }),)
          ],
        ),
      )
    );
  }
}





