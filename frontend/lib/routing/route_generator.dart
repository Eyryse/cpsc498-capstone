import 'package:flutter/material.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/views/course_page.dart';
import 'package:frontend/views/course_creation_page.dart';
import 'package:frontend/views/error_page.dart';
import 'package:frontend/views/home_page.dart';
import 'package:frontend/views/library_page.dart';
import 'package:frontend/views/login_page.dart';
import 'package:frontend/views/register_page.dart';
import 'package:frontend/views/settings_page.dart';
import 'package:frontend/views/test_page.dart';
import 'package:frontend/views/user_profile_page.dart';

class RouteGenerator {
	static Route<dynamic> _ErrorRoute(RouteSettings settings) {
		return MaterialPageRoute(
			settings: settings,
			builder: (context) => const ErrorPage()
		);
	}

	static Route<dynamic> generateRoute(RouteSettings settings) {
		final settingsSplit = settings.name == null ? ['', ''] : settings.name!.split('?');
		final name = settingsSplit[0];
		final args = (settingsSplit.length <= 1 ? Uri(query: '') : Uri(query: settingsSplit[1])).queryParameters;
		
		switch (name) {
			case CourseRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const CoursePage()
				);
			case CourseCreateRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const CourseCreationPage()
				);
			case HomeRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const HomePage()
				);
			case LibraryRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const LibraryPage()
				);
			case LoginRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const LoginPage()
				);
			case RegisterRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const RegisterPage()
				);
			case SettingsRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const SettingsPage()
				);
			case TestRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const TestPage()
				);
			case UserProfileRoute:
				return MaterialPageRoute(
					settings: settings,
					builder: (context) => const UserProfilePage()
				);
			default:
				return _ErrorRoute(settings);
		}
	}
}
