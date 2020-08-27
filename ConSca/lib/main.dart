import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conociendo los Scaffold',
      home: Homiespage(),
    );
  }
}

class Homiespage extends StatefulWidget {
  const Homiespage({
    Key key,
  }) : super(key: key);

  @override
  _HomiespageState createState() => _HomiespageState();
}

class _HomiespageState extends State<Homiespage> {
  final _textController = TextEditingController();
  bool _isActive = true;
  bool _isseen = true;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    var _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Click the FAB'),
        backgroundColor: Colors.black54,
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: _isseen ? Colors.blue : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isseen = !_isseen;
                });
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Número actual de clicks es: ${_counter}"),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _counter++;
                }); 
                _scaffoldKey.currentState
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("HI"),
                    ),
                  );
              }, //On pressed
              color: Colors.purple,
              child: Text(
                "Click me bitch",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
