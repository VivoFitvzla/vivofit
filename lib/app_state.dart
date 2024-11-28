import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _buscador = false;
  bool get buscador => _buscador;
  set buscador(bool value) {
    _buscador = value;
  }

  List<String> _ubicacion = [
    'Venezuela',
    'China',
    'India',
    'Europa',
    'Iran',
    'Dubai'
  ];
  List<String> get ubicacion => _ubicacion;
  set ubicacion(List<String> value) {
    _ubicacion = value;
  }

  void addToUbicacion(String value) {
    ubicacion.add(value);
  }

  void removeFromUbicacion(String value) {
    ubicacion.remove(value);
  }

  void removeAtIndexFromUbicacion(int index) {
    ubicacion.removeAt(index);
  }

  void updateUbicacionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    ubicacion[index] = updateFn(_ubicacion[index]);
  }

  void insertAtIndexInUbicacion(int index, String value) {
    ubicacion.insert(index, value);
  }
}
