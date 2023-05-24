import 'package:flutter/material.dart';

class RowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RowPage();
}

class _RowPage extends State<RowPage> {
  TextEditingController myRowController = TextEditingController(); // 내 단수

  TextEditingController packRowController = TextEditingController(); // 도안 단수

  TextEditingController cmRowController = TextEditingController(); // 떠야 할 cm

  TextEditingController castonRowController =
      TextEditingController(); // cast on row

  Map<String, double> calDict = {
    'myRow': 0,
    'packRow': 0,
    'castOnRow': 0,
    'cmRow': 0,
    'resRow': 0,
    'resCmRow': 0,
  };

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("내 스와치의 단수"), Text("도안 게이지의 단수")])),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: myRowController,
                    decoration: InputDecoration(hintText: "내 스와치의 단수")),
              )),
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: packRowController,
                    decoration: InputDecoration(hintText: "도안 게이지의 단수")),
              )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text("뜨고 싶은 단수"), Text("내가 떠야할 단수는?")])),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: castonRowController,
                    decoration: InputDecoration(hintText: "뜨고싶은 단수")),
              )),
              Flexible(
                  child: SizedBox(
                width: 150,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    '떠야 할 단수: ${calDict['resRow']}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: cmRowController,
                    decoration: InputDecoration(hintText: "뜨고싶은 cm")),
              )),
              Flexible(
                  child: SizedBox(
                width: 150,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    '떠야 할 단수: ${calDict['resCmRow']}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            //계산하기 버튼
            child: Row(
              children: <Widget>[
                Icon(Icons.question_mark_outlined),
                Text("계산하기")
              ],
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue)),
            onPressed: () {
              setState(() {
                print("==setState==");
                print("before");
                print(calDict);

                calDict['myRow'] = myRowController.value.text.isEmpty
                    ? 0
                    : double.parse(myRowController.value.text);

                calDict['packRow'] = packRowController.value.text.isNotEmpty
                    ? double.parse(packRowController.value.text)
                    : 0;
                calDict['castOnRow'] = castonRowController.value.text.isNotEmpty
                    ? double.parse(castonRowController.value.text)
                    : 0;

                calDict['cmRow'] = cmRowController.value.text.isNotEmpty
                    ? double.parse(cmRowController.value.text)
                    : 0;

                print("after");
                print(calDict);
                //키보드 숨기기
                FocusManager.instance.primaryFocus?.unfocus();

                if (calDict['myRow'] != 0 &&
                    calDict['packRow'] != 0 &&
                    calDict['castOnRow'] != 0) {
                  calDict['resRow'] = calDict['castOnRow']! /
                      calDict['packRow']! *
                      calDict['myRow']!;

                  print("this is row cal");
                }

                if (calDict['myRow'] != 0 &&
                    //calDict['packRow'] != 0 &&
                    calDict['cmRow'] != 0) {
                  calDict['resCmRow'] =
                      double.parse(myRowController.value.text) /
                          10 *
                          double.parse(cmRowController.value.text);
                }
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                myRowController.clear();
                packRowController.clear();
                castonRowController.clear();
                cmRowController.clear();

                calDict = {
                  'myRow': 0,
                  'packRow': 0,
                  'castOnRow': 0,
                  'cmRow': 0,
                  'resRow': 0,
                  'resCmRow': 0,
                };
              });
            },
            child: Row(children: [Icon(Icons.refresh), Text("다시하기")]),
          ),
        ),
      ],
    );
  }
}
