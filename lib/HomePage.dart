import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulugulu_flutter/widget/CustomButton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{
  int _counter = 0;
  var platform = const MethodChannel("app.channel.shared.data");

  String _shareText = "no data";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openFadePage() {
    Navigator.of(context).pushNamed('/fadePage');
  }

  Future<void> getShareText() async {
    String shareText = await platform.invokeMethod('getShareText');
    if (shareText.isNotEmpty) {
      setState(() {
        _shareText = shareText;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getShareText();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.resumed:
        getShareText();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          OutlinedButton(onPressed: _openFadePage, child: const Text("打开FadeAnimate")),
          TextButton(child: Text(_shareText), onPressed: () { getShareText(); },),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          const CustomButton("自定义Widget")
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}