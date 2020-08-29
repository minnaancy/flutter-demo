import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var _controllerYear = TextEditingController();
  var _controllerMonth = TextEditingController();

  selectYear(BuildContext context) {
    DatePicker.showDatePicker(context, dateFormat: 'yyyy',
        onConfirm: (year, List<int> events) {
      DateTime date = DateTime.parse(year.toString());
      _handleTapYear(date.year.toString());
    });
  }
  
  selectMonth(BuildContext context) {
    DatePicker.showDatePicker(context, dateFormat: 'MM',
        onConfirm: (year, List<int> events) {
      DateTime date = DateTime.parse(year.toString());
      _handleTapMonth(date.month.toString());
    });
  }

  void _handleTapYear(year) {
    setState(() {
      _controllerYear.text = year.toString();
    });
  }

  void _handleTapMonth(month) {
    setState(() {
      _controllerMonth.text = month.toString();
    });
  }

  List<String> _language = <String>[
    'English',
    'Hindi',
    'Malayalam',
    'Tamil',
    'Other'
  ];

  var selectLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios, color: Colors.white),
            title: const Text("Profile")),
        body: new ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            getProfile(context),
          ],
        ));
  }

  Widget getProfile(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Preferred Language",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                SizedBox(
                  height: 10.0,
                ),
                topSection(),
                SizedBox(
                  height: 10.0,
                ),
                Text("Login and Security",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                SizedBox(
                  height: 10.0,
                ),
                halfSection(),
                Text("Saved Cards",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                middleSection(),
                SizedBox(
                  height: 15.0,
                ),
                Text("Add a New Card",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)),
                SizedBox(
                  height: 15.0,
                ),
                bottomSection()
              ],
            )));
  }

  Widget topSection() {
    return Container(
        width: 650,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: Colors.grey[350],
                  height: 40,
                  width: 370.0,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    items: _language
                        .map((value) => DropdownMenuItem(
                              child: Text(value,
                                  style: TextStyle(color: Colors.black)),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (selectedLanguage) {
                      setState(() {
                        selectLanguage = selectedLanguage;
                      });
                    },
                    value: selectLanguage,
                    isExpanded: false,
                    hint: Text('Select Language',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black)),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundColor: Color(0xFFC4C4C4), radius: 45),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 5, 0, 80)),
                Column(
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () => {
                      },
                      child: new Card(
                        color: Colors.white,
                        shape: BeveledRectangleBorder(),
                        child: new Container(
                            width: 260,
                            height: 50,
                            child: ListTile(
                              leading: Icon(Icons.crop_original),
                              title: Text(
                                'Choose From Gallery',
                                style: TextStyle(
                                    color: Colors.blueGrey[500],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0),
                              ),
                            )),
                      ),
                    ),
                    new GestureDetector(
                      onTap: () => {},
                      child: new Card(
                        color: Colors.white,
                        shape: BeveledRectangleBorder(),
                        child: new Container(
                            width: 260,
                            height: 50,
                            child: ListTile(
                              leading: Icon(Icons.camera),
                              title: Text(
                                'Take a Picture',
                                style: TextStyle(
                                    color: Colors.blueGrey[500],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ));
  }

  Widget editSection() {
    return SizedBox(
      width: 100.0,
      height: 36.2,
      child: FlatButton(
        child: Text('Edit'),
        color: Colors.white,
        textColor: Colors.blueGrey[500],
        onPressed: () {},
      ),
    );
  }

  Widget halfSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Name",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.blueGrey[12], fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Material(
          elevation: 20.0,
          shadowColor: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 260,
                height: 37.0,
                child: new TextField(
                    controller: null,
                    autofocus: false,
                    style: new TextStyle(fontSize: 12.0, color: Colors.black),
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Your Name',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
              editSection(),
            ],
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text("E-mail",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        Material(
          elevation: 20.0,
          shadowColor: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 260,
                height: 37.0,
                child: new TextField(
                    controller: null,
                    autofocus: false,
                    style: new TextStyle(fontSize: 12.0, color: Colors.black),
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Your Email.id',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
              editSection(),
            ],
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text("Mobile Number",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Material(
          elevation: 20.0,
          shadowColor: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 260,
                height: 37.0,
                child: new TextField(
                    controller: null,
                    autofocus: false,
                    style: new TextStyle(fontSize: 12.0, color: Colors.black),
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '+(123)4567890',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
              editSection(),
            ],
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text("Password",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Material(
          elevation: 20.0,
          shadowColor: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 260,
                height: 37.0,
                child: new TextField(
                    controller: null,
                    autofocus: false,
                    style: new TextStyle(fontSize: 12.0, color: Colors.black),
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '************',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                      ),
                    )),
              ),
              Padding(padding: EdgeInsets.fromLTRB(2, 0, 0, 0)),
              editSection(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(4, 10, 20, 20),
          child: new SizedBox(
            width: 200.0,
            height: 50.0,
            child: FlatButton(
              child: Text('Save Changes'),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Widget middleSection() {
    return new Card(
      color: Colors.white,
      shape: BeveledRectangleBorder(),
      child: new Container(
          width: 500,
          height: 130,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(313, 0, 0, 0),
                      child: new SizedBox(
                        width: 50.0,
                        height: 25.0,
                        child: FlatButton(
                          child: Icon(Icons.close),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      )),
                ],
              ),
  
              ListTile(
                  title: Text(
                    'HDFC Bank Debit Card ****5467',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  trailing: Icon(Icons.credit_card)),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bob',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0),
                    ),
                    Text(
                      'Expires 12/2022',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget bottomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Name on card",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        new TextField(
            controller: null,
            autofocus: false,
            style: new TextStyle(fontSize: 12.0, color: Colors.black),
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            )),
        SizedBox(
          height: 8.0,
        ),
        Text("Card Number",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        new TextField(
            controller: null,
            autofocus: false,
            style: new TextStyle(fontSize: 12.0, color: Colors.black),
            decoration: new InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
            )),
        SizedBox(
          height: 8.0,
        ),
        Text("Expiry Date",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: <Widget>[
            Material(
              elevation: 20.0,
              shadowColor: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(                  
                    width: 100,
                    height: 40.0,
                    child: new TextField(
                      readOnly: true,
                      controller: _controllerMonth,
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[350],
                        hintStyle: TextStyle(fontSize: 13.0),
                        hintText: 'Month',
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => selectMonth(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Material(
              elevation: 20.0,
              shadowColor: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 105,
                    height: 40.0,
                    child: new TextField(
                      readOnly: true,
                      controller: _controllerYear,
                      style: TextStyle(fontSize: 13.0),
                      decoration: InputDecoration(
                         filled: true,
                        fillColor: Colors.grey[350],
                        hintStyle: TextStyle(fontSize: 13.0),
                        hintText: 'Year',
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () => selectYear(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(4, 10, 20, 20),
          child: new SizedBox(
            width: 200.0,
            height: 50.0,
            child: FlatButton(
              child: Text('Add Card'),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}