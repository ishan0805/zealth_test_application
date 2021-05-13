import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zealth_test_application/models/symptomsmodel.dart';
import 'package:zealth_test_application/screens/symptoms/symptom_details.dart';

class AddSymptoms extends StatefulWidget {
  @override
  AddSymptomsState createState() => AddSymptomsState();
}

class AddSymptomsState extends State<AddSymptoms> {
  bool isSymptomPresent = false;
  List<Widget> _symptoms = [];
  Map<String, bool> _symptomMap = {'fatigue': false, 'vomiting': false};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEdgeDragWidth: 15,
      drawer: Drawer(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Text("In Progress"),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Symptoms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "Search & Add Symptoms",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 2, color: Color(0xFFA5B2BE)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 5,
                        child: isSymptomPresent
                            ? Row(
                                children: _symptoms,
                              )
                            : CupertinoSearchTextField(
                                itemColor: Color(0xFF3E5061),
                                prefixInsets: EdgeInsets.all(8),
                                placeholder: 'Search symptoms',
                                placeholderStyle:
                                    TextStyle(fontWeight: FontWeight.w300),
                                backgroundColor: Colors.white,
                              )),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary:
                                  isSymptomPresent ? Colors.pink : Colors.grey,
                              minimumSize: Size(64, 20),
                              backgroundColor: isSymptomPresent
                                  ? Colors.pink.withOpacity(0.16)
                                  : Colors.grey.withOpacity(0.16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              List<Symptom> ob = [];
                              if (_symptomMap['fatigue']) {
                                ob.add(
                                  Symptom(
                                      name: 'fatigue',
                                      info1: "Able to do most activities",
                                      info2: "In bed less than 50 % the day",
                                      info3: "In bed more than 50% of the day"),
                                );
                              }
                              if (_symptomMap['vomiting']) {
                                ob.add(
                                  Symptom(
                                      name: 'vomiting',
                                      info1: "Vomited once during the day",
                                      info2: "Vomited 2-5 times during the day",
                                      info3:
                                          "Vomited 6 or more times during the day"),
                                );
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SymptomsDetails(
                                            symptons: ob,
                                          )));
                            },
                            child: Text("Check"),
                          ),
                          SizedBox(width: 1)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Flexible(child: Text("sugested symptoms")),
            SizedBox(height: 15),
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCard(
                    title: "fatigue",
                    onTap: () {
                      setState(() {
                        if (_symptomMap['fatigue'] == false) {
                          _symptomMap['fatigue'] = true;
                          _symptoms.add(CustomAvatar(
                            title: 'fatigue',
                          ));
                        }
                        isSymptomPresent = true;
                      });
                    },
                  ),
                  CustomCard(
                    title: "vomiting",
                    onTap: () {
                      setState(() {
                        if (_symptomMap['vomiting'] == false) {
                          _symptomMap['vomiting'] = true;
                          _symptoms.add(CustomAvatar(
                            title: 'vomiting',
                          ));
                        }
                        isSymptomPresent = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Function onTap;
  CustomCard({this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage("assets/images/$title.jpg"),
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  final String title;

  CustomAvatar({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 2, 2),
      child: SizedBox(
        height: 30,
        child: Row(
          children: [
            Image(
              image: AssetImage("assets/images/$title.jpg"),
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 3,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
