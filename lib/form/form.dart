import 'package:flutter/material.dart';
import 'package:other/form/form_content.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _textController = TextEditingController();
  bool _buttonEnabled = false;

  @override
  void initState() {
    super.initState();
    final formProvider = Provider.of<FormContent>(context, listen: false);
    formProvider.getName((String? str) {
      if (str != null) {
        _textController.text = str;
      }
    });
    _textController.addListener(() {
      if (formProvider.name != null) {
        final bool updatedValue = _textController.text != formProvider.name;
        if (updatedValue != _buttonEnabled) {
          setState(() {
            _buttonEnabled = _textController.text != formProvider.name;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textController,
              style: Theme.of(context).textTheme.headline4,
              enabled: context.watch<FormContent>().name != null,
            ),
            TextButton(
              child: const Text("Save changes"),
              onPressed: _buttonEnabled ? () {} : null,
            )
          ],
        ),
      ),
    );
  }
}
