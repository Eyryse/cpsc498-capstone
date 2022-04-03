import 'package:flutter/material.dart';

import 'package:frontend/routing/paths.dart';

class CourseCard extends StatefulWidget {
	const CourseCard({Key? key}) : super(key: key);
	
	@override
	State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 4.0,
			child: SizedBox(
				width: MediaQuery.of(context).size.width * (220/1280),
				height: MediaQuery.of(context).size.height * (130/720),
				child: InkWell(
					onTap: () {
						Navigator.pushNamed(context, CourseRoute);
					},
					onHover: (hover) {},
					child: Padding(
						padding: const EdgeInsets.all(8.0),
						child: Column(
							children: <Widget>[
								Row(
									children: <Widget>[
										Text(
											'Course Name',
											style: Theme.of(context).textTheme.titleLarge,
										),
									],
								),
								Spacer(),
								Row(
									children: <Widget>[
										Text(
											'Username',
											style: Theme.of(context).textTheme.labelLarge,
										),
									],
								),
							],
						),
					),
				),
			),
		);
	}
}
