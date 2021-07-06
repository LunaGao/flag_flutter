import 'package:example/restart_widget.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(RestartWidget(child: MyApp()));

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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? displayFlagPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flag.fromCode(
                FlagsCode.AD,
                height: 100,
              ),
              Flag.fromCode(
                FlagsCode.AD,
                height: 10,
                width: 100,
                fit: BoxFit.fill,
              ),
              Flag.fromString(
                'ACC',
                height: 10,
                width: 100,
                fit: BoxFit.fill,
              ),
              Flag.fromString(
                'ACC',
                height: 10,
                width: 100,
                fit: BoxFit.fill,
                replacement: Text('ACC not found'),
              ),
              if (Flag.flagsCode.contains('AF'.toLowerCase()))
                Flag.fromString(
                  'af',
                  height: 10,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: displayFlagPicker == null
                        ? () => setState(() {
                              displayFlagPicker = false;
                            })
                        : null,
                    child: Text('no preCache'),
                  ),
                  ElevatedButton(
                    onPressed: displayFlagPicker == null
                        ? () => setState(() {
                              displayFlagPicker = true;
                            })
                        : null,
                    child: Text('preCache'),
                  ),
                  ElevatedButton(
                    onPressed: () => RestartWidget.restartApp(context),
                    child: Text('restart'),
                  ),
                ],
              ),
              if (displayFlagPicker != null)
                FlagPicker(
                  width: 50,
                  height: 300,
                  preCache: displayFlagPicker!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlagPicker extends StatefulWidget {
  const FlagPicker({Key? key, this.width, this.height, this.preCache = false})
      : super(key: key);

  final double? width;
  final double? height;
  final bool preCache;

  @override
  _FlagPicker createState() => _FlagPicker();
}

class _FlagPicker extends State<FlagPicker> {
  late FixedExtentScrollController _controller;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _controller = FixedExtentScrollController(
      initialItem: _currentIndex,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.preCache) {
      Flag.preloadFlag(context: context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: CupertinoPicker.builder(
        scrollController: _controller,
        offAxisFraction: 0.0,
        itemExtent: 40,
        childCount: Flag.flagsCode.length,
        useMagnifier: true,
        magnification: 1.0,
        diameterRatio: 0.8,
        onSelectedItemChanged: (value) {
          setState(() {
            print(value);
          });
        },
        itemBuilder: (context, index) => Center(
          child: Flag.fromString(
            Flag.flagsCode[index],
          ),
        ),
      ),
    );
  }
}
