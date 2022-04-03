import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class CoursePage extends StatefulWidget {
	const CoursePage({Key? key}) : super(key: key);

	@override
	State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

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
									height: MediaQuery.of(context).size.height * (305/720),
									child: Card(),
								),
								SizedBox(
									width: MediaQuery.of(context).size.width * (1100/1280),
									height: MediaQuery.of(context).size.height * (50/720),
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
