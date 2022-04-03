import 'package:flutter/material.dart';

import 'package:frontend/routing/paths.dart';

enum CourseOptions { bookmark, favorite, enroll, create }

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
					value: CourseOptions.bookmark,
					child: ListTile(
						leading: Icon(Icons.bookmarks),
						title: Text('Bookmarked Courses'),
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
			onSelected: (value) => {
				if (value == CourseOptions.enroll) {
					Navigator.pushNamed(context, LibraryRoute)
				}
				else if (value == CourseOptions.bookmark) {
					Navigator.pushNamed(context, LibraryRoute)
				}
				else if (value == CourseOptions.favorite) {
					Navigator.pushNamed(context, LibraryRoute)
				}
				else if (value == CourseOptions.create) {
					Navigator.pushNamed(context, CourseCreateRoute)
				}
			},
		);
	}
}
