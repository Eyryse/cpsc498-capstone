import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class UserProfilePage extends StatefulWidget {
	const UserProfilePage({Key? key}) : super(key: key);

	@override
	State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
									height: MediaQuery.of(context).size.height * (110/720),
									child: Card(),
								),
								SizedBox(
									width: MediaQuery.of(context).size.width * (1100/1280),
									height: MediaQuery.of(context).size.height * (55/720),
									child: Card(),
								),
								SizedBox(
									width: MediaQuery.of(context).size.width * (1100/1280),
									height: MediaQuery.of(context).size.height * (360/720),
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
