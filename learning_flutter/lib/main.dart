import 'package:flutter/material.dart';
// import './app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Exploring UI',
    home: Scaffold(
      appBar: AppBar(
        title: Text("Basic List View"),
      ),
      body: getListView(),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

List<String> getListElements() {
  var items = List<String>.generate(100, (counter) => "Item ${counter + 1}");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        debugPrint('${listItems[index]} was tapped.');
      },
    );
  });
  return listView;
}
