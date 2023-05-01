import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "check gague",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text("게이지 계산기")),
          body: MyGagueApp(),
        ));
  }
}

class MyGagueApp extends StatefulWidget {
  @override
  _MyGagueState createState() => _MyGagueState();
}

class _MyGagueState extends State<MyGagueApp> {
  TextEditingController my_row = TextEditingController(); // 내 단수
  TextEditingController my_st = TextEditingController(); // 내 코수

  TextEditingController pack_row = TextEditingController(); // 도안 단수
  TextEditingController pack_st = TextEditingController(); // 도안 코수

  TextEditingController caston_row = TextEditingController(); // cast on row
  TextEditingController caston_st = TextEditingController(); // cast on st

  double res_st = 0;
  double res_row = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("내 스와치의 게이지를 입력해주세요(코수, 단수 순서)")),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: my_st,
                decoration: InputDecoration(helperText: "내 스와치의 코수"),
              )),
              Flexible(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: my_row,
                      decoration: InputDecoration(helperText: "내 스와치의 단수"))),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("도안의 게이지를 입력해주세요(코수, 단수 순서)")),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: pack_st,
                decoration: InputDecoration(helperText: "도안 게이지의 코수"),
              )),
              Flexible(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: pack_row,
                      decoration: InputDecoration(helperText: "도안 게이지의 단수"))),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text("패키지의 시작(cast-on)코수 또는 단수 ")),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: TextField(
                keyboardType: TextInputType.number,
                controller: caston_st,
                decoration: InputDecoration(helperText: "잡아야 하는(떠야하는) 코수"),
              )),
              Flexible(
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: caston_row,
                      decoration: InputDecoration(helperText: "떠야하는 단수"))),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
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
                var myst, myrow, packst, packrow, castonst, castonrow;

                my_st.value.text.isNotEmpty
                    ? myst = double.parse(my_st.value.text)
                    : 0;

                my_row.value.text.isNotEmpty
                    ? myrow = double.parse(my_row.value.text)
                    : 0;

                pack_st.value.text.isNotEmpty
                    ? packst = double.parse(pack_st.value.text)
                    : 0;

                pack_row.value.text.isNotEmpty
                    ? packrow = double.parse(pack_row.value.text)
                    : 0;

                caston_st.value.text.isNotEmpty
                    ? castonst = double.parse(caston_st.value.text)
                    : 0;

                caston_row.value.text.isNotEmpty
                    ? castonrow = double.parse(caston_row.value.text)
                    : 0;

                print('${myrow} ${myst} \n ${packrow} ${packst}');
                print('${castonst} ${castonrow}');

                if (myrow != null && packrow != null && castonrow != null) {
                  res_row = castonrow / packrow * myrow;
                }
                if (myst != null && packst != null && castonst != null) {
                  res_st = castonst / packst * myst;
                }
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            '떠야 할 코수: ${res_st},\n떠야 할 단수: ${res_row}',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ));
  }
}