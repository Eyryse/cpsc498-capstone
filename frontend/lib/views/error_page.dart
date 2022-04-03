import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

import 'package:frontend/routing/paths.dart';

class ErrorPage extends StatefulWidget {
	const ErrorPage({Key? key}) : super(key: key);

	@override
	State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					Column(
						children: <Widget>[
							Text('Error'),
							Text('This page does not exist'),	
						],
					),
					Spacer(),
				],
			),
		);
	}
}
