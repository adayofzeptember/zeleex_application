import 'package:flutter/material.dart';
import 'checkBox_model.dart';

void main(List<String> args) {
  runApp(Check_Box());
}

class Check_Box extends StatefulWidget {
  Check_Box({Key? key}) : super(key: key);

  @override
  State<Check_Box> createState() => _Check_BoxState();
}

class _Check_BoxState extends State<Check_Box> {
  var allCheck = CheckboxState(title: 'Check All');
  var someCheckList;

  void x() {
    someCheckList = [
      CheckboxState(title: 'test1'),
      CheckboxState(title: 'test3'),
      CheckboxState(title: 'test4')
    ];
  }

  @override
  void initState() {
    x();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('CheckBox'),
        ),
        body: Column(
          children: [
 
            buildGroupCheckBox(allCheck),
            SizedBox(
              height: 50,
            ),
            ...someCheckList.map(buildSingleCheckBox).toList()
          ],
        ),
      ),
    );
  }

  Widget buildSingleCheckBox(CheckboxState checkBox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkBox.title),
        value: checkBox.value,
        onChanged: (value) {
          setState(() {
            checkBox.value = value!;
            allCheck.value = someCheckList.every((element) => element.value);
          });
        },
      );

  Widget buildGroupCheckBox(CheckboxState checkBox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkBox.title),
        value: checkBox.value,
        onChanged: toggleGroupCheckBox,
      );

  void toggleGroupCheckBox(bool? value) {
    if (value == null) return;
    setState(() {
      allCheck.value = value;
      someCheckList.forEach((e) => e.value = value);
    });
  }
}
