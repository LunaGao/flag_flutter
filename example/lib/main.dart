import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Flag(
                'AD',
                height: 100,
              ),
              SizedBox(
                height: 100,
              ),
              Flag(
                'AD',
                height: 10,
                width: 100,
                fit: BoxFit.fill,
              ),
              Flag(
                'ACC',
                height: 10,
                width: 100,
                fit: BoxFit.fill,
              ),
              Flag(
                'ACC',
                height: 10,
                width: 100,
                fit: BoxFit.fill,
                replacement: Text('ACC not found'),
              ),
              if (Flag.flagsCode.contains('AF'.toLowerCase()))
                Flag(
                  'af',
                  height: 10,
                  width: 100,
                  fit: BoxFit.fill,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
