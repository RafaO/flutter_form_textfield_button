import 'package:flutter/material.dart';
import 'package:other/form_basic/form_basic_widget.dart';
import 'package:other/form_provider/form.dart';
import 'package:other/form_provider/form_content.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FormContent())],
      child: const MyApp(),
    ),
  );
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter showcase")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: const Text('Form basic'),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const FormBasicWidget(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Form provider'),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const FormWidget(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
