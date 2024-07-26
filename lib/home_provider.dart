
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeProvider extends ChangeNotifier {
  List allist = [];
  void loaddata() async {
    String data = await rootBundle.loadString("assets/adhay.json");
    Map<String, dynamic> jdata = jsonDecode(data);
    allist = jdata["adhay"];
    notifyListeners();
  }
}
