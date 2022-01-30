import 'package:flutter/cupertino.dart';

class FormContent with ChangeNotifier {
  String? name;

  void getName(Function(String?) onLoad) async {
    await Future.delayed(const Duration(seconds: 1));
    name = "charlie";
    onLoad(name);
    notifyListeners();
  }
}
