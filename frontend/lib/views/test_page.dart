import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class TestPage extends StatefulWidget {
	final arguments;

	TestPage({Key? key, @required this.arguments}) : super(key: key);

	@override
	State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
				],
			),
		);
	}
}
