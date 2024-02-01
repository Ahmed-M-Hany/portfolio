import 'package:flutter/material.dart';

class PositionProvider extends ChangeNotifier{
  double _position = 0;
  double get position => _position;
  void setPosition(double newPosition){
    _position = newPosition;
    notifyListeners();
  }
}