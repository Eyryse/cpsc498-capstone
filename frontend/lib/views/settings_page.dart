import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class SettingsPage extends StatefulWidget {
	const SettingsPage({Key? key}) : super(key: key);

	@override
	State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					SizedBox(
						width: MediaQuery.of(context).size.width * (1100/1280),
						height: MediaQuery.of(context).size.height * (525/720),
						child: Column(
							children: <Widget>[
								SizedBox(
									width: MediaQuery.of(context).size.width * (1100/1280),
									height: MediaQuery.of(context).size.height * (50/720),
									child: Card(),
								),
								SizedBox(
									width: MediaQuery.of(context).size.width * (1100/1280),
									height: MediaQuery.of(context).size.height * (475/720),
									child: Card(),
								),
							],
						),
					),
					Spacer(),
				],
			),
		);
	}
}
