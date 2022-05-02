import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _Authorization = prefs.getString('ff_Authorization') ?? _Authorization;
    _image = prefs.getStringList('ff_image') ?? _image;
  }

  SharedPreferences prefs;

  String _Authorization = '';
  String get Authorization => _Authorization;
  set Authorization(String _value) {
    _Authorization = _value;
    prefs.setString('ff_Authorization', _value);
  }

  String newAuthorization = '';

  String name = '';

  List<String> _image = [];
  List<String> get image => _image;
  set image(List<String> _value) {
    _image = _value;
    prefs.setStringList('ff_image', _value);
  }

  void addToImage(String _value) {
    _image.add(_value);
    prefs.setStringList('ff_image', _image);
  }

  void removeFromImage(String _value) {
    _image.remove(_value);
    prefs.setStringList('ff_image', _image);
  }

  dynamic viewimg;

  String returnimg;

  String returnOutImg;

  bool boolIn = false;

  bool boolOut = false;

  String currentTotal = '';

  bool elapsedbool = false;
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
