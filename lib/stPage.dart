import 'package:flutter/material.dart';

class StPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StPage();
}

class _StPage extends State<StPage> {
  TextEditingController myStController = TextEditingController(); // 내 코수

  TextEditingController packStController = TextEditingController(); // 도안 코수

  TextEditingController castonStController =
      TextEditingController(); // cast on st

  Map<String, double> calDict = {
    'mySt': 0,
    'packSt': 0,
    'castOnSt': 0,
    'resSt': 0,
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
            padding: EdgeInsets.only(top: 30),
            child: Text("내 스와치의 코수를 입력해주세요")),
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
                  controller: myStController,
                  decoration: InputDecoration(hintText: "내 스와치의 코수"),
                ),
              )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("도안 게이지의 코수를 입력해주세요")),
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
                  controller: packStController,
                  decoration: InputDecoration(hintText: "도안 게이지의 코수"),
                ),
              )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30), child: Text("떠야하는(잡아야하는) 코수")),
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
                  controller: castonStController,
                  decoration: InputDecoration(hintText: "잡아야하는 코수"),
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

                calDict['mySt'] = myStController.value.text.isEmpty
                    ? 0
                    : double.parse(myStController.value.text);

                calDict['packSt'] = packStController.value.text.isNotEmpty
                    ? double.parse(packStController.value.text)
                    : 0;

                calDict['castOnSt'] = castonStController.value.text.isNotEmpty
                    ? double.parse(castonStController.value.text)
                    : 0;

                print("after");
                print(calDict);
                //키보드 숨기기
                FocusManager.instance.primaryFocus?.unfocus();

                if (calDict['mySt'] != 0 &&
                    calDict['packSt'] != 0 &&
                    calDict['castOnSt'] != 0) {
                  calDict['resSt'] = calDict['castOnSt']! /
                      calDict['packSt']! *
                      calDict['mySt']!;

                  print("this is St cal");
                }
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '떠야 할 코수: ${calDict['resSt']}',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                myStController.clear();
                packStController.clear();
                castonStController.clear();

                calDict = {
                  'mySt': 0,
                  'packSt': 0,
                  'castOnSt': 0,
                  'resSt': 0,
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
