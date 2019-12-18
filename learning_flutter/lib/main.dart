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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
        },
        child: Icon(Icons.add),
        tooltip: 'Add one more Item',
      ),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: () {
        debugPrint("Performing undo");
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
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
        showSnackBar(context, listItems[index]);
      },
    );
  });
  return listView;
}
