import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firedart/firedart.dart';

const apiKey = '"AIzaSyB4o2uNst0-JNnkaiuRkGr6iZHS2K8iyq4"';
const projectId = 'tally-d39ef';

class CheckBoxTask extends StatefulWidget {
  final String title;
  final String description;
  final double width;
  final double height;
  final List<int> color;
  final String value;

  const CheckBoxTask(
      {required this.title,
      required this.description,
      required this.width,
      required this.height,
      required this.color,
      required this.value});

  @override
  State<CheckBoxTask> createState() => _CheckBoxTaskState();
}

class _CheckBoxTaskState extends State<CheckBoxTask> {
  bool _valueBox = false;

  void main(List<String> args) {
    Firestore.initialize(projectId);
  }

  @override
  void initState() {
    super.initState();
    _valueBox = toBoolean(widget.value);
  }

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  void toggleCheckboxValue() {
    setState(() {
      _valueBox = !_valueBox;
      updateCheckBoxValue(widget.title, _valueBox, widget.description);
    });
  }

  Future<void> updateCheckBoxValue(
      String title, bool value, String deskripsi) async {
    final todoCollection = Firestore.instance.collection('todo');

    final querySnapshot = await todoCollection
        .where('title', isEqualTo: widget.title)
        .where('deskripsi', isEqualTo: widget.description)
        .get();

    print(querySnapshot);

    if (querySnapshot.length > 0) {
      final document = querySnapshot.first;
      final docId = document.id;
      await todoCollection.document(docId).update({'value': value.toString()});
      print('Checkbox value updated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: widget.width / 150,
                height: widget.height / 15,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, widget.color[1], widget.color[2],
                        widget.color[3])),
              ),
              SizedBox(
                width: widget.width / 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: widget.width / 25,
                        color: Color.fromARGB(255, widget.color[1],
                            widget.color[2], widget.color[3]),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(widget.description)
                ],
              ),
            ],
          ),
          Checkbox(
              value: _valueBox,
              onChanged: (newValue) {
                setState(() {
                  toggleCheckboxValue();
                });
                ;
              })
        ],
      ),
    );
  }
}
