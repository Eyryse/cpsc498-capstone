import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/register_form/register_form.dart';

class RegisterPage extends StatefulWidget {
	const RegisterPage({Key? key}) : super(key: key);

	@override
	State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
	final nameController = TextEditingController();
	final emailController = TextEditingController();
	final passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					RegisterForm(),
					Spacer(),
				],
			),
		);
	}
}
