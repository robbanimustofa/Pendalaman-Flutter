import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scorecount',
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.blue,
      ),
      home: TeamPage(),
    );
  }
}

class TeamPage extends StatelessWidget {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "SCORECOUNT",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [            
          Container(
            width: 320,
            child: Text("Team 1",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: myController1,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  labelText: "Input your team name here",
                  filled: true,
                  fillColor: Colors.orange[50]),
            ),
          ),
          Container(
            width: 320,
            child: Text("Team 2",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.all(12),
            child: TextField(
              controller: myController2,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  labelText: "Input your team name here",
                  filled: true,
                  fillColor: Colors.orange[50]),
            ),
          ),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.only(top: 25),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.orange)),
              color: Colors.orange,
              child: Text(
                "START",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CounterPage(
                            team1: myController1.text,
                            team2: myController2.text,
                          )),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({this.team1, this.team2});
  String team1, team2;

  @override
  _CounterPageState createState() =>
      _CounterPageState(team1: team1, team2: team2);
}

class _CounterPageState extends State<CounterPage> {
  void initState() {
    super.initState();
  }

  _CounterPageState({this.team1, this.team2});
  String team1, team2;

  int _score1 = 0;
  int _score2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SCORECOUNT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.orange[50],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  margin: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          team1,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 170,
                        margin: EdgeInsets.only(bottom: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text('$_score1',
                            style: TextStyle(
                                fontSize: 120, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.orange)),
                                  color: Colors.orange,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_score1 != 0) {
                                        _score1--;
                                      } else {
                                        _score1 = 0;
                                      }
                                    });
                                  }),
                            ),
                            Container(
                              width: 55,
                              height: 55,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.orange)),
                                  color: Colors.orange,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _score1++;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  margin: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          team2,
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 170,
                        margin: EdgeInsets.only(bottom: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.orange),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text('$_score2',
                            style: TextStyle(
                                fontSize: 120, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.orange)),
                                  color: Colors.orange,
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_score2 != 0) {
                                        _score2--;
                                      } else {
                                        _score2 = 0;
                                      }
                                    });
                                  }),
                            ),
                            Container(
                              width: 55,
                              height: 55,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.orange)),
                                  color: Colors.orange,
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _score2++;
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 320,
            height: 50,
            margin: EdgeInsets.only(top: 40, bottom: 12),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.orange)),
              color: Colors.orange,
              child: Text(
                "RESET",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                team1 = '';
                team2 = '';
                _score1 = 0;
                _score2 = 0;
              },
            ),
          ),
        ],
      )),
    );
  }
}
