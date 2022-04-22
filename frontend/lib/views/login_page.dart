import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/login_form/login_form.dart';

class LoginPage extends StatefulWidget {
	const LoginPage({Key? key}) : super(key: key);

	@override
	State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					LoginForm(),
					Spacer(),
				],
			),
		);
	}
}
