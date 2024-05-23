import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState extends ChangeNotifier{
  bool isDarkMode = false;

  void toggleDarkMode(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

}


final appProvider = ChangeNotifierProvider<AppState>((ref){
  return AppState();
});