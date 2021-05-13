import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zealth_test_application/screens/report/report.dart';

import 'home/homepage.dart';
import 'medication/medication.dart';
import 'symptoms/add_symptoms.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 1;
  var _options = [HomePage(), AddSymptoms(), Medications(), Report()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _options[_index],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Color(0xFFFF0270),
        unselectedItemColor: Color(0xFF3E5061),
        onTap: (selectedindex) {
          setState(() {
            _index = selectedindex;
          });
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.thermometer), label: "Symptoms"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.medkit), label: "Medication"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartArea), label: "Report"),
        ],
      ),
    );
  }
}
