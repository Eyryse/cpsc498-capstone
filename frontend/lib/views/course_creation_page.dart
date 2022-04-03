import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class CourseCreationPage extends StatefulWidget {
	const CourseCreationPage({Key? key}) : super(key: key);

	@override
	State<CourseCreationPage> createState() => _CourseCreationPageState();
}

class _CourseCreationPageState extends State<CourseCreationPage> {

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
						height: MediaQuery.of(context).size.height * (480/720),
						child: Card(),
					),
					Spacer(),
					SizedBox(
						width: MediaQuery.of(context).size.width * (500/1280),
						height: MediaQuery.of(context).size.height * (45/720),
						child: Card(),
					),
					Spacer(),
				],
			),
		);
	}
}
