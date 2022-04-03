import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
	ThemeData _selectedTheme = ThemeData.fallback();
	
	ThemeProvider({bool theme = false}) {
		_selectedTheme = theme ? ThemeData.dark() : ThemeData.light();
	}
	
	void swapTheme() async {
		SharedPreferences prefs = await SharedPreferences.getInstance();
		if (_selectedTheme == ThemeData.dark()) {
			_selectedTheme = ThemeData.light();
			prefs.setBool("theme", false);
		}
		else {
			_selectedTheme = ThemeData.dark();
			prefs.setBool("theme", true);
		};
		notifyListeners();
	}
	
	ThemeData get getTheme {
		return _selectedTheme;
	}
}
