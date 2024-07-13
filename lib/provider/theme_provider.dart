import 'package:flutter/material.dart';
import 'package:saropa_task/utils/storage/local_storage.dart';
import 'package:saropa_task/utils/themes/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = AppTheme.darkTheme;

  ThemeProvider() {
    _loadFromPrefs();
  }

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      _themeData = AppTheme.darkTheme;
    } else {
      _themeData = AppTheme.lightTheme;
    }
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() async {
    bool isDark = LocalStorage.getBool('isDark') ?? false;
    _themeData = isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }

  _saveToPrefs() async {
    LocalStorage.setBool('isDark', _themeData == AppTheme.darkTheme);
  }
}
