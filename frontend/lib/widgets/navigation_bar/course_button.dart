import 'package:flutter/material.dart';
import 'package:format/format.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/widgets/crud_course/course/create_course.dart';

enum CourseOptions { watch, favorite, enroll, create }

class CourseButton extends StatefulWidget {
	const CourseButton({Key? key}) : super(key: key);
	
	@override
	State<CourseButton> createState() => _CourseButtonState();
}

class _CourseButtonState extends State<CourseButton> {

	@override
	Widget build(BuildContext context) {
		return PopupMenuButton<CourseOptions>(
			icon: Icon(Icons.library_books),
			iconSize: 45,
			offset: Offset(0, 60),
			itemBuilder: (context) => [
				PopupMenuItem(
					value: CourseOptions.enroll,
					child: ListTile(
						leading: Icon(Icons.local_library),
						title: Text('Enrolled Courses'),
					),
				),
				PopupMenuItem(
					value: CourseOptions.watch,
					child: ListTile(
						leading: Icon(Icons.bookmarks),
						title: Text('Watched Courses'),
					),
				),
				PopupMenuItem(
					value: CourseOptions.favorite,
					child: ListTile(
						leading: Icon(Icons.favorite),
						title: Text('Favorite Courses'),
					),
				),
				PopupMenuItem(
					value: CourseOptions.create,
					child: ListTile(
						leading: Icon(Icons.add),
						title: Text('Create Course'),
					),
				),
			],
			onSelected: (value) {
				if (value == CourseOptions.enroll) {
					Map<String, String> queryParams = {
						'type': 'enrolled',
					};
					Navigator.pushNamed(
						context,
						'{}?{}'.format(
							LibraryRoute,
							Uri(queryParameters: queryParams).query,
						)
					);
				}
				else if (value == CourseOptions.watch) {
					Map<String, String> queryParams = {
						'type': 'watched',
					};
					Navigator.pushNamed(
						context,
						'{}?{}'.format(
							LibraryRoute,
							Uri(queryParameters: queryParams).query,
						)
					);
				}
				else if (value == CourseOptions.favorite) {
					Map<String, String> queryParams = {
						'type': 'favorited',
					};
					Navigator.pushNamed(
						context,
						'{}?{}'.format(
							LibraryRoute,
							Uri(queryParameters: queryParams).query,
						)
					);
				}
				else if (value == CourseOptions.create) {
					create_course_dialog(context);
				}
			},
		);
	}
}
