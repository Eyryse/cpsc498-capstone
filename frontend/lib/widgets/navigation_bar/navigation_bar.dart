import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';

import 'account_button.dart';
import 'course_button.dart';
import 'notifications_button.dart';
import 'search_bar/search_bar.dart';
import 'theme_button.dart';

import 'package:frontend/routing/paths.dart';

class NavBar extends StatelessWidget {
	const NavBar({Key? key}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return PreferredSize(
			preferredSize: const Size.fromHeight(75.0),
			child: Card(
				color: Theme.of(context).primaryColor,
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						Container(
							width: ((1/6) * 100).vw,
							child: IconButton(
								icon: Icon(Icons.home),
								onPressed: () {
									Navigator.pushNamed(context, HomeRoute);
								},
							),
						),
						Center(
							child: Container(
								width: ((3/6) * 100).vw,
								child: SearchBar(),
							),
						),
						Container(
							child: Row(
								children: <Widget>[
									CourseButton(),
									NotificationsButton(),
									AccountButton(),
									Container(
										height: 45,
										child: VerticalDivider(
											thickness: 3,
											color: Theme.of(context).backgroundColor,
										),
									),
									ThemeButton(),
								],
							),
						),
					],
				),
			),
		);
	}
}
