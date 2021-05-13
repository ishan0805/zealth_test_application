import 'package:flutter/material.dart';

class Medications extends StatefulWidget {
  Medications({Key key}) : super(key: key);

  @override
  _MedicationsState createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("In Progress"),
      ),
    );
  }
}
