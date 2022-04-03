import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:frontend/services/theme_provider.dart';

class ThemeButton extends StatefulWidget {
	const ThemeButton({Key? key}) : super(key: key);
	
	@override
	State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
	var _themeIcon = Icons.light_mode;
	
	void _setThemeIcon(BuildContext context) {
		ThemeProvider themeProvider = Provider.of<ThemeProvider>(
			context,
			listen: false,
		);
		setState(() {
			if (themeProvider.getTheme == ThemeData.light()) {
				_themeIcon = Icons.light_mode;
			}
			else {
				_themeIcon = Icons.dark_mode;
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		_setThemeIcon(context);
		return IconButton(
			icon: Icon(
				_themeIcon,
			),
			iconSize: 45,
			onPressed: () {
				ThemeProvider themeProvider = Provider.of<ThemeProvider>(
					context,
					listen: false,
				);
				themeProvider.swapTheme();
				_setThemeIcon(context);
			},
		);
	}
}
