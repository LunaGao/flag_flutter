import 'package:example/restart_widget.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: ListView(
          children: <Widget>[
            Column(
              spacing: 10.0,
              children: [
                Flag.fromCode(
                  FlagsCode.XX,
                  height: 100,
                ),
                Flag.fromCode(
                  FlagsCode.NP,
                  height: 100,
                ),
                Flag.fromCode(
                  FlagsCode.AD,
                  height: 10,
                  width: 100,
                  fit: BoxFit.fill,
                ),
                Flag.fromCode(
                  FlagsCode.AD,
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                  flagSize: FlagSize.size_1x1,
                  borderRadius: 25,
                ),
                Flags.fromCode(
                  [
                    FlagsCode.GB,
                    FlagsCode.CN,
                  ],
                  height: 100,
                  width: 100 * 4 / 3,
                ),
                Flag.fromString(
                  'ACC',
                  height: 10,
                  width: 100,
                  fit: BoxFit.fill,
                  replacement: Text('ACC not found'),
                ),
                Divider(),
                if (Flag.flagsCode.contains('AF'.toLowerCase()))
                  Flag.fromString(
                    'af',
                    height: 10,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
              ],
            ),
            // Static asset path examples
            _buildPathExample(),
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
              ),
          ],
        ),
      ),
    );
  }

  /// Builds examples showing flags alongside their asset paths
  Widget _buildPathExample() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Static Asset Path Examples:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),

          // Japan flag (4x3) example
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 53,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset(
                  Flag.getAssetPath('jp'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Japan (4x3):',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      Flag.getAssetPath('jp'),
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'monospace',
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Canada flag (1x1) example
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SvgPicture.asset(
                    Flag.getAssetPathFromCode(FlagsCode.CA,
                        flagSize: FlagSize.size_1x1),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Canada (1x1):',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      Flag.getAssetPathFromCode(FlagsCode.CA,
                          flagSize: FlagSize.size_1x1),
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'monospace',
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // United States flag (4x3) example
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 53,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset(
                  Flag.getAssetPathFromCode(FlagsCode.US),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('United States (4x3):',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                      Flag.getAssetPathFromCode(FlagsCode.US),
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'monospace',
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlagPicker extends StatefulWidget {
  const FlagPicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

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
