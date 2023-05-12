import 'package:flutter/material.dart';
import 'package:my_gauge/calPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "check gague",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyGagueApp(),
    );
  }
}

class MyGagueApp extends StatefulWidget {
  @override
  _MyGagueState createState() => _MyGagueState();
}

class _MyGagueState extends State<MyGagueApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '게이지 계산기',
        ),
        backgroundColor: Colors.lightBlue[800],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: Colors.lightBlue),
              accountName: Text(
                "앱에 대한 문의사항은\n아래 이메일로 문의해 주세요.",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              accountEmail: Text(
                "kokori91@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.home,
            //   ),
            //   title: const Text('Page 1'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.train,
            //   ),
            //   title: const Text('Page 2'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
            AboutListTile(
              icon: Icon(
                Icons.info,
              ),
              child: Text('앱 정보'),
              applicationIcon: Icon(
                Icons.local_play,
              ),
              applicationName: '게이지 계산기',
              applicationVersion: '1.0.1',
              applicationLegalese: '©2023 day by dy, kokori',
              aboutBoxChildren: [],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: CalPage(),
      )),
    );
  }
}
