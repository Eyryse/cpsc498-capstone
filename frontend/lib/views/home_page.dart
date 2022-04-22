import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

import 'package:frontend/routing/paths.dart';

class HomePage extends StatefulWidget {
	const HomePage({Key? key}) : super(key: key);

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					SizedBox(
						width: MediaQuery.of(context).size.width * (1000/1280),
						height: MediaQuery.of(context).size.height * (435/720),
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Column(
									children: <Widget>[ /*
										Spacer(),
										Text(
											'Learn online in a format that replicates academic environments',
											style: Theme.of(context).textTheme.headlineLarge,
										),
										Spacer(),
										Text(
											'Avoid learning plateaus by being tested on material and get immediate feedback',
											style: Theme.of(context).textTheme.headlineMedium,
										),
										Spacer(),
										Text(
											'Automatic pacing established with spaced repetition',
											style: Theme.of(context).textTheme.headlineMedium,
										),
										*/
										Spacer(),
									],
								)
							),
						),
					),
					Spacer(),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Spacer(),
							SizedBox(
								width: MediaQuery.of(context).size.width * (150/1280),
								height: MediaQuery.of(context).size.height * (45/720),
								child: Card(
									child: InkWell(
										onTap: () {
											Navigator.pushNamed(context, LoginRoute);
										},
										onHover: (hover) {},
										child: Center(
											child: Text('Login'),
										),
									),
								),
							),
							Spacer(),
							SizedBox(
								width: MediaQuery.of(context).size.width * (150/1280),
								height: MediaQuery.of(context).size.height * (45/720),
								child: Card(
									child: InkWell(
										onTap: () {
											Navigator.pushNamed(context, RegisterRoute);
										},
										onHover: (hover) {},
										child: Center(
											child: Text('Register'),
										),
									),
								),
							),
							Spacer(),
						],
					),
					Spacer(),
					Row(
						children: <Widget>[
						],
					),
					Spacer(),
				],
			),
		);
	}
}
