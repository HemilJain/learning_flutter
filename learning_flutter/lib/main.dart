import 'package:flutter/material.dart';
// import './app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Exploring UI',
    home: Scaffold(
      appBar: AppBar(
        title: Text("Basic List"),
      ),
      body: getListView(),
    ),
    // home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

Widget getListView() {
  var listView = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful Views"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          debugPrint("Landscape tapped");
        },
      ),
      ListTile(
          leading: Icon(Icons.laptop_chromebook),
          title: Text("Windows"),
          onTap: () {
            EdgeInsets.only(left: 50.0);
          }),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Android"),
      ),
      Text("Yet another element"),
      Container(
        color: Colors.red,
        height: 50.0,
      )
    ],
  );
  return listView;
}
