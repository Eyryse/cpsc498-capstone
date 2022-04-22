import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaled_size/scaled_size.dart';

import 'package:frontend/services/theme_provider.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/routing/route_generator.dart';

class eLearningApp extends StatelessWidget {
	const eLearningApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Consumer<ThemeProvider>(
			builder: (context, themeProvider, child) {
				return ScaledSize(
					allowTextScaling: true,
					size: Size(1280, 720),
					builder: () {
						return MaterialApp(
							title: 'eLearning',
							debugShowCheckedModeBanner: false,
							theme: themeProvider.getTheme,
							initialRoute: HomeRoute,
							onGenerateRoute: RouteGenerator.generateRoute,
						);
					}
				);
			}
		);
	}
}
