import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/course_card.dart';

class LibraryPage extends StatefulWidget {
	const LibraryPage({Key? key}) : super(key: key);

	@override
	State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					SizedBox(
						width: MediaQuery.of(context).size.width * (1100/1280),
						height: MediaQuery.of(context).size.height * (450/720),
						child: Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										CourseCard(),
										CourseCard(),
										CourseCard(),
										CourseCard(),
									],
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										CourseCard(),
										CourseCard(),
										CourseCard(),
										CourseCard(),
									],
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										CourseCard(),
										CourseCard(),
										CourseCard(),
										CourseCard(),
									],
								),
							],
						),
					),
					Spacer(),
					Card(
						elevation: 4.0,
						child: SizedBox(
							width: MediaQuery.of(context).size.width * (500/1280),
							height: MediaQuery.of(context).size.height * (45/720),
							child: Row(
								children: <Widget>[
									IconButton(
										icon: Icon(Icons.arrow_back_ios),
										iconSize: 30,
										onPressed: () {},
									),
									Spacer(),
									IconButton(
										icon: Icon(Icons.arrow_forward_ios),
										iconSize: 30,
										onPressed: () {},
									),
								],
							),
						),
					),
					Spacer(),
				],
			),
		);
	}
}
