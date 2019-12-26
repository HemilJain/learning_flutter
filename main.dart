import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator App',
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var formKey = GlobalKey<FormState>();
  final minimumPadding = 5.0;
  var currencies = ['INR', 'USD', 'GBP'];
  var currentItemSelected = 'INR';
  TextEditingController principalControlled = TextEditingController();
  TextEditingController roiControlled = TextEditingController();
  TextEditingController termControlled = TextEditingController();

  var displayResult = "";
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(minimumPadding * 2.0),
              child: ListView(
                children: <Widget>[
                  getImageAsset(),
                  Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: principalControlled,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the principal amount';
                          }
                          if (!isNumeric(value)) {
                            return 'Please enter valid principal';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Principle',
                            hintText: 'Enter Principal amount',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: roiControlled,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the ROI';
                          }
                          if (!(isNumeric(value))) {
                            return 'Please enter valid ROI';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Rate of Interest',
                            hintText: 'In percentage',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)))),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              controller: termControlled,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter the term';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Term',
                                  hintText: 'Time in years',
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))))),
                      Container(width: minimumPadding * 5.0),
                      Expanded(
                          child: DropdownButton<String>(
                        items: currencies.map(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        value: currentItemSelected,
                        onChanged: (String newValueSelected) {
                          onDropdownItemSelected(newValueSelected);
                        },
                      )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: minimumPadding, bottom: minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text(
                              "Calculate",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (formKey.currentState.validate()) {
                                  this.displayResult = calculateTotalReturns();
                                }
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              "Reset",
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(minimumPadding),
                    child: Text(
                      '$displayResult',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage("images/Plane.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(minimumPadding * 10.0),
    );
  }

  void onDropdownItemSelected(String newValueSelected) {
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }

  String calculateTotalReturns() {
    double principal = double.parse(principalControlled.text);
    double roi = double.parse(roiControlled.text);
    double term = double.parse(termControlled.text);

    double result = principal + (principal * roi * term) / 100.0;

    String ans =
        "After $term years, you will get $currentItemSelected $result.";
    return ans;
  }

  bool isNumeric(String s) {
    if (s == null) return false;
    return double.tryParse(s) != null;
  }
}
