import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zealth_test_application/models/symptomsmodel.dart';
import 'package:zealth_test_application/resources/symptons_update_api_provider.dart';

class SymptomsDetails extends StatefulWidget {
  final List<Symptom> symptons;
  SymptomsDetails({@required this.symptons});

  @override
  _SymptomsDetailsState createState() => _SymptomsDetailsState();
}

class _SymptomsDetailsState extends State<SymptomsDetails> {
  int index = 0;
  int severity = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Symptoms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "More about ${widget.symptons[index].name}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Flexible(
                flex: 4,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      CustomRadioView(
                        info: widget.symptons[index].info1,
                        color: Color(0xFFFFC515),
                        severity: severity,
                        value: 1,
                        onChange: (value) {
                          setState(() {
                            severity = value;
                          });
                        },
                      ),
                      CustomRadioView(
                        info: widget.symptons[index].info2,
                        color: Color(0xFFFF902A),
                        severity: severity,
                        value: 2,
                        onChange: (value) {
                          setState(() {
                            severity = value;
                          });
                        },
                      ),
                      CustomRadioView(
                        info: widget.symptons[index].info3,
                        color: Color(0xFFFF2020),
                        severity: severity,
                        value: 3,
                        onChange: (value) {
                          setState(() {
                            severity = value;
                          });
                        },
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 15),
            Flexible(
                flex: 3,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Any medication / Comments",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Comment",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Spacer(
              flex: 2,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Color(0xFFA5B2BE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (index == 0) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          index--;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back),
                        Text("Previous"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      primary: Color(0xFF51C185),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (index == widget.symptons.length - 1) {
                        widget.symptons[index].severity = severity;
                        bool isTrue = await SymptomsUpdateApiProvider()
                            .postSymptonsUpdate(widget.symptons);
                        String m = "Updated Successfully";
                        if (isTrue == false) {
                          m = "Some Error Occured";
                        }
                        final snackBar = SnackBar(content: Text(m));

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        setState(() {
                          widget.symptons[index].severity = severity;
                          index++;
                        });
                      }
                    },
                    child: index == widget.symptons.length - 1
                        ? Text("Update")
                        : Text("Next"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomRadioView extends StatelessWidget {
  const CustomRadioView({
    @required this.severity,
    @required this.info,
    @required this.value,
    @required this.color,
    @required this.onChange,
  });

  final int value;
  final String info;
  final int severity;
  final Color color;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage("assets/images/$value.jpg"),
            fit: BoxFit.contain,
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 3, 2),
              child: Text(
                info,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
      activeColor: color,
      value: value,
      groupValue: severity,
      onChanged: onChange,
    );
  }
}
