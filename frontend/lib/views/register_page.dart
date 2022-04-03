import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class RegisterPage extends StatefulWidget {
	const RegisterPage({Key? key}) : super(key: key);

	@override
	State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					Column(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							SizedBox(
								width: MediaQuery.of(context).size.width * (700/1280),
								height: MediaQuery.of(context).size.height * (200/720),
								child: Card(),
							),
							SizedBox(
								width: MediaQuery.of(context).size.width * (350/1280),
								height: MediaQuery.of(context).size.height * (45/720),
								child: TextField(
									decoration: InputDecoration(
										border: OutlineInputBorder(),
										fillColor: Theme.of(context).scaffoldBackgroundColor,
										filled: true,
										hintText: 'e-Mail',
									),
								),
							),
							SizedBox(
								width: MediaQuery.of(context).size.width * (350/1280),
								height: MediaQuery.of(context).size.height * (45/720),
								child: TextField(
									decoration: InputDecoration(
										border: OutlineInputBorder(),
										fillColor: Theme.of(context).scaffoldBackgroundColor,
										filled: true,
										hintText: 'Username',
									),
								),
							),
							SizedBox(
								width: MediaQuery.of(context).size.width * (350/1280),
								height: MediaQuery.of(context).size.height * (45/720),
								child: TextField(
									decoration: InputDecoration(
										border: OutlineInputBorder(),
										fillColor: Theme.of(context).scaffoldBackgroundColor,
										filled: true,
										hintText: 'Password',
									),
								),
							),
							SizedBox(
								width: MediaQuery.of(context).size.width * (350/1280),
								height: MediaQuery.of(context).size.height * (60/720),
								child: Card(
									child: InkWell(
										onTap: () {},
										onHover: (hover) {},
										child: Center(
											child: Text('Create'),
										),
									),
								),
							),
						],
					),
					Spacer(),
				],
			),
		);
	}
}
