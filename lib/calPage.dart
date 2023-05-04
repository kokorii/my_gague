import 'package:flutter/material.dart';

class CalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalPage();
}

class _CalPage extends State<CalPage> {
  TextEditingController myRowController = TextEditingController(); // 내 단수
  TextEditingController myStController = TextEditingController(); // 내 코수

  TextEditingController packRowController = TextEditingController(); // 도안 단수
  TextEditingController packStController = TextEditingController(); // 도안 코수

  TextEditingController castonRowController =
      TextEditingController(); // cast on row
  TextEditingController castonStController =
      TextEditingController(); // cast on st

  var myst, myrow, packst, packrow, castonst, castonrow;

  double resSt = 0;
  double resRow = 0;

  @override
  void dispose() {
    myRowController.dispose();
    myStController.dispose();
    packRowController.dispose();
    packStController.dispose();
    packRowController.dispose();
    castonStController.dispose();
    castonRowController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("내 스와치의 게이지를 입력해주세요(코수, 단수 순서)")),
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
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: myRowController,
                    decoration: InputDecoration(hintText: "내 스와치의 단수")),
              )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("도안의 게이지를 입력해주세요(코수, 단수 순서)")),
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
            padding: EdgeInsets.only(top: 30),
            child: Text("패키지의 시작(cast-on)코수 또는 단수 ")),
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
                  decoration: InputDecoration(hintText: "잡아야 하는(떠야하는) 코수"),
                ),
              )),
              Flexible(
                  child: SizedBox(
                width: 150,
                child: TextField(
                    keyboardType: TextInputType.number,
                    controller: castonRowController,
                    decoration: InputDecoration(hintText: "떠야하는 단수")),
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
                myStController.value.text.isNotEmpty
                    ? myst = double.parse(myStController.value.text)
                    : 0;

                myRowController.value.text.isNotEmpty
                    ? myrow = double.parse(myRowController.value.text)
                    : 0;

                packStController.value.text.isNotEmpty
                    ? packst = double.parse(packStController.value.text)
                    : 0;

                packRowController.value.text.isNotEmpty
                    ? packrow = double.parse(packRowController.value.text)
                    : 0;

                castonStController.value.text.isNotEmpty
                    ? castonst = double.parse(castonStController.value.text)
                    : 0;

                castonRowController.value.text.isNotEmpty
                    ? castonrow = double.parse(castonRowController.value.text)
                    : 0;

                //키보드 숨기기
                FocusManager.instance.primaryFocus?.unfocus();

                print('$myrow, $myst \n '
                    '$packrow, $packst');
                print('$castonrow, $castonst');

                print("cal result: $resSt, $resRow");

                if (myrow != 0 && packrow != 0 && castonrow != 0) {
                  resRow = castonrow / packrow * myrow;
                }
                if (myst != 0 && packst != 0 && castonst != 0) {
                  resSt = castonst / packst * myst;
                }
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '떠야 할 코수: $resSt,\n떠야 할 단수: $resRow',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                myStController.clear();
                myRowController.clear();
                packStController.clear();
                packRowController.clear();
                castonStController.clear();
                castonRowController.clear();

                myst = 0;
                myrow = 0;
                packst = 0;
                packrow = 0;
                castonst = 0;
                castonrow = 0;

                resRow = 0;
                resSt = 0;
              });
            },
            child: Row(children: [Icon(Icons.refresh), Text("다시하기")]),
          ),
        ),
      ],
    );
  }
}
