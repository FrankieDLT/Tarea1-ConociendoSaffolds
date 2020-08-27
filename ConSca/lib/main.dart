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
  bool _isseen = true;
  int _counter = 0;

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gal.jpg"),
            fit: BoxFit.cover,
            ),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Número actual de clicks es: ${_counter}",
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });

                    if (_counter % 2 == 0) {
                      _scaffoldKey.currentState
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Par"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                    } else {
                      _scaffoldKey.currentState //.hideCurrentSnackBar();
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Impar"),
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: "I´m a button :D",
                              onPressed: () {
                                DateTime _time = DateTime.now();
                                String _fecha = "${_time.day.toString().padLeft(2,'0')}/${_time.month.toString().padLeft(2,'0')}/${_time.year.toString()}";
                                String _hora = "${_time.hour.toString()}:${_time.minute.toString()}";
                                //Mostrar Dialogo
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: Text("Fecha y Hora Actual:"),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text("Fecha: ${_fecha}"),
                                            Text("Hora: ${_hora}"),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Salir"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }, //Onpressed
                            ),
                          ),
                        );
                    }
                  }, //On pressed
                  color: Colors.purple,
                  child: Text(
                    "Click me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
