import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:frontend/services/theme_provider.dart';
import 'package:frontend/eLearningApp.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	
	SharedPreferences prefs = await SharedPreferences.getInstance();
	runApp(
		ChangeNotifierProvider(
			create: (BuildContext context) => ThemeProvider(theme: prefs.getBool('theme') ?? false),
			child: eLearningApp(),
		),
	);
}
