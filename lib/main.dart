import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  bool _buttonEnabled = false;
  String? _initialValue;
  bool _firstLoad = true;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      if (!_firstLoad) {
        final bool updatedValue = _textController.text != _initialValue;
        if (updatedValue != _buttonEnabled) {
          setState(() {
            _buttonEnabled = _textController.text != _initialValue;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<String> _getString() async {
    await Future.delayed(const Duration(seconds: 1));
    return "charlie";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<String>(
          future: _getString(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (_firstLoad && snapshot.hasData) {
              final data = snapshot.requireData;
              _initialValue = data;
              _textController.text = data;
              _firstLoad = false;
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _textController,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  TextButton(
                    child: const Text("Save changes"),
                    onPressed: _buttonEnabled ? () {} : null,
                  )
                ],
              ),
            );
          }),
    );
  }
}
