import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _textController = TextEditingController();
  bool _buttonEnabled = false;
  String? _initialValue;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      if (_initialValue != null) {
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
        title: const Text("Form"),
      ),
      body: FutureBuilder<String>(
          future: _getString(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (_initialValue == null && snapshot.hasData) {
              final data = snapshot.requireData;
              _initialValue = data;
              _textController.text = data;
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _textController,
                    style: Theme.of(context).textTheme.headline4,
                    enabled: snapshot.hasData,
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
