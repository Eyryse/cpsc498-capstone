import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/user_information/user_information.dart';

class UserProfilePage extends StatefulWidget {
	final arguments;

	UserProfilePage({Key? key, @required this.arguments}) : super(key: key);

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
					UserInformation(
						arguments: widget.arguments,
					),
					Spacer(),
				],
			),
		);
	}
}
