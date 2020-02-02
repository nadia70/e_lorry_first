import 'package:flutter/material.dart';

class lpoForm extends StatefulWidget {
  String itemName;
  String itemQuantity;
  String itemNumber;
  String reqPrice;

  lpoForm({
    this.itemName,
    this.itemQuantity,
    this.itemNumber,
    this.reqPrice,

  });


  @override
  _lpoFormState createState() => _lpoFormState();
}

class _lpoFormState extends State<lpoForm> {

  TextEditingController lpoNumber = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController att = new TextEditingController();
  TextEditingController terms = new TextEditingController();
  TextEditingController prepared = new TextEditingController();
  TextEditingController confirm = new TextEditingController();
  TextEditingController approve = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Container(
            height: 200.0,
            decoration: new BoxDecoration(
              color: Colors.grey.withAlpha(50),
              borderRadius: new BorderRadius.only(
                bottomRight: new Radius.circular(100.0),
                bottomLeft: new Radius.circular(100.0),
              ),
            ),
          ),
          new SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 50.0,
                ),
                new Card(
                  child: new Container(
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: new Text(
                            "Details",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                        new SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 5.0,
                        ),

                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new SizedBox(
                                  width: 5.0,
                                ),
                                new Image.asset(
                                  'assets/logo.png',
                                  fit: BoxFit.contain,
                                  height: 200.0,
                                  width: 300.0,
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                new Text(
                                  "Cell: +254-705-617118",
                                  style: new TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                new Text(
                                  "Email: +254-705-617118",
                                  style: new TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),

                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    new Text(
                                      "PIN NO: PO51399991D",
                                      style: new TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w700),
                                    ),

                                    new Text(
                                      "VAT NO: 466644",
                                      style: new TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                new Text(
                                  "LPO NO: ",
                                  style: new TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700),
                                ),
                                new Text(
                                  "4931",
                                  style: new TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),

                        new SizedBox(
                          height: 5.0,
                        ),

                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new SizedBox(
                                  width: 5.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    productTextField(
                                        textTitle: "To",
                                        textHint: "Company name",
                                        controller: company),
                                    new SizedBox(
                                      height: 10.0,
                                    ),

                                    productTextField(
                                        textTitle: "ATT",
                                        textHint: "",
                                        controller: att),
                                    new SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                productTextField(
                                    textTitle: "Date",
                                    textHint: "mm/dd/yyyy",
                                    controller: date),
                                new SizedBox(
                                  height: 10.0,
                                ),
                                productTextField(
                                    textTitle: "Terms",
                                    textHint: "Terms",
                                    controller: terms),
                                new SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ],
                        ),

                        new SizedBox(
                          height: 5.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: new Table(
                            border: TableBorder.all(),
                            defaultVerticalAlignment: TableCellVerticalAlignment.top,
                            children: <TableRow>[
                              ///First table row with 3 children
                              TableRow(children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    color: Colors.grey,
                                    height: 30.0,
                                    child: Center(
                                      child: Text(
                                        "QUANTITY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    color: Colors.grey,
                                    width: 50.0,
                                    height: 30.0,
                                    child: Center(
                                      child: Text(
                                        "UNIT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    color: Colors.grey,
                                    width: 50.0,
                                    height: 30.0,
                                    child: Center(
                                      child: Text(
                                        "DESCRIPTION",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    color: Colors.grey,
                                    width: 50.0,
                                    height: 30.0,
                                    child: Center(
                                      child: Text(
                                        "AMOUNT",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              ///Second table row with 3 children
                              TableRow(children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        widget.itemQuantity,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 48.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        "Row 2 \n Element 2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        widget.itemName,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        widget.reqPrice,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),

                              TableRow(children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        "Total:",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 48.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Text(
                                        widget.reqPrice,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 6.0,),
                                      ),
                                    ),
                                  ),
                                ),

                              ]),

                              TableRow(children: <Widget>[
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 50.0,
                                    height: 48.0,
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          productTextField(
                                              textTitle: "Confirmed by",
                                              controller: confirm),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 48.0,
                                    height: 48.0,
                                    child: Column(
                                      children: <Widget>[
                                        productTextField(
                                              textTitle: "Prepared by:",
                                            controller: prepared),
                                      ],
                                    ),
                                  ),
                                ),

                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    width: 48.0,
                                    height: 48.0,
                                    child: Column(
                                      children: <Widget>[
                                        productTextField(
                                            textTitle: "Approved by:",
                                            controller: approve),
                                      ],
                                    ),
                                  ),
                                ),

                              ]),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget productTextField(
    {String textTitle,
      String textHint,
      double height,
      TextEditingController controller,
      TextInputType textType}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return Row(
    //mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
          new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Container(
          height: height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,
              maxLines: 4,
              decoration: new InputDecoration(
                  border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget sign(
    {String textTitle,
      String textHint,
      double height,
      TextEditingController controller,
      TextInputType textType}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return Column(
    //mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
          new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Container(
          height: height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,
              maxLines: 4,
              decoration: new InputDecoration(
                  border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}
