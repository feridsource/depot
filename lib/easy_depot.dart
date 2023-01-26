library easy_depot;

import 'dart:convert';

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Practical shared preferences with encryption option.
class EasyDepot {
  late SharedPreferences _prefs; // shared preferences
  late EncryptedSharedPreferences _prefsSecure; // encrypted preferences

  EasyDepot() {
    initStorage();
  }

  /// Initialises storage.
  Future<void> initStorage() async {
    _prefs = await SharedPreferences.getInstance();
    _prefsSecure = EncryptedSharedPreferences(prefs: _prefs);
  }

  /// Saves integer.
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  /// Reads integer.
  Future<int?> getInt(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt(key);
  }

  /// Saves double.
  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  /// Reads double.
  Future<double?> getDouble(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getDouble(key);
  }

  /// Saves boolean.
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Reads integer.
  Future<bool?> getBool(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(key);
  }

  /// Saves string.
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// Reads string.
  Future<String?> getString(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  /// Encrypts and saves string.
  void setSecString(String key, String value) {
    _prefsSecure.setString(key, value);
  }

  /// Reads and decrypts string.
  Future<String> getSecString(String key) async {
    return await _prefsSecure.getString(key);
  }

  /// Saves any object.
  void saveObject(String key, dynamic value) {
    String valueJson = jsonEncode(value);
    _prefsSecure.setString(key, valueJson);
  }

  /// Reads any object.
  Future<dynamic> readObject(String key) async {
    String valueJson = await _prefsSecure.getString(key);
    return jsonDecode(valueJson);
  }

  /// Encrypts and saves any object.
  void saveSecObject(String key, dynamic value) {
    String valueJson = jsonEncode(value);
    _prefsSecure.setString(key, valueJson);
  }

  /// Reads and decrypts any object.
  Future<dynamic> readSecObject(String key) async {
    String valueJson = await _prefsSecure.getString(key);
    return jsonDecode(valueJson);
  }

  /// Removes encrypted string.
  Future<void> removeSec(String key) async {
    _prefsSecure.remove(key);
  }

  /// Deletes all stored data.
  Future<void> deleteSecAll() async {
    _prefsSecure.clear();
  }
}