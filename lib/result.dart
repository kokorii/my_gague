import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int my_row; // 내 단수
  int pack_row; // 도안 단수
  int my_st; // 내 코수
  int pack_st; // 도안 단수
  int res_st = 0;
  int res_row = 0;

  Result(
      {required this.my_row,
      required this.pack_row,
      required this.my_st,
      required this.pack_st});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("게이지 계산 결과")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "게이지 : 코수 x 단수",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "도안의 게이지 : ${pack_st} x ${pack_row} 입니다.",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "나의 게이지 : ${my_st} x ${my_row} 이며,",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "내가 떠야할 게이지 : ${res_st} x ${res_row} 입니다.",
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}
