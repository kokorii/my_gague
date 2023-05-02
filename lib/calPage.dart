import 'package:flutter/material.dart';

class CalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalPage();
}

class _CalPage extends State<CalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculator gauge page'),
      ),
      body: Container(
        child: Center(child: Text("계산기 페이지")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
