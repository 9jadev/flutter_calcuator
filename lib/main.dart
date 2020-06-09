import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "0";
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  alertable(){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Whopss'),
          content: Text("Calculator context already contains a decimal.")
         );
      }
    );
  }


  buttonPressed(String buttonText){
    if (buttonText == "CLEAR") {
      _output = "0";
      output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == "."){
      if(_output.contains(".")){
        alertable();
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "="){
      num2 = double.parse(output);
      if (operand == "+"){
        _output = (num1 + num2).toString();
      }

      if (operand == "-"){
        _output = (num1 - num2).toString();
      }

      if (operand == "X"){
        _output = (num1 * num2).toString();
      }

      if (operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "0"; 
      print(_output);
    } else {
     _output = _output + buttonText;
    }
    // print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText){
    return  Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(23.0),
        onPressed: (){
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.black,
              fontSize: 23.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/")
                  ]
                ),
                Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X")
                  ]
                ),
                Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-")
                  ]
                ),
                Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+")
                  ]
                ),
                Row(
                  children: <Widget>[
                    buildButton("CLEAR"),
                    buildButton("=")
                  ],
                )
              ]
            )
          ],
        )
      ),
    );
  }
}
