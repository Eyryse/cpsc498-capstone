import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/course_card/course_card.dart';
import 'package:frontend/routing/paths.dart';
import 'package:frontend/queries/api_query.dart';
import 'package:frontend/utils/graphql_client.dart';

class LibraryPage extends StatefulWidget {
	final arguments;

	LibraryPage({Key? key, @required this.arguments}) : super(key: key);

	@override
	State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
	List<dynamic> courses = List.empty();
	
	QueryOptions<Object?> _getOptions(String? type, String? searchText) {
		switch(type) {
			case 'all' :
				if (searchText == null) {
					continue missing;
				}
				return QueryOptions(
					document: gql(searchCourses),
					variables: <String, dynamic> {
						'searchText': searchText,
					},
				);
			case 'enrolled' :
				return QueryOptions(
					document: gql(enrolledCourses),
				);
			case 'watched' :
				return QueryOptions(
					document: gql(watchedCourses),
				);
			case 'favorited' :
				return QueryOptions(
					document: gql(favoritedCourses),
				);
			missing:
			default:
				Navigator.pushNamed(context, HomeRoute);
				break;
		}
		return QueryOptions(
			document: gql(whoami),
		);
	}

	@override
	Widget build(BuildContext context) {
		var type = widget.arguments?['type'];
		var searchText = widget.arguments?['search'];
		
		final QueryOptions options = _getOptions(type, searchText);
		final GraphQLClient client = gqlclient();
		final Future<QueryResult> result = client.query(options);
		
		result.then((info) {
			if (info.hasException) {
				print(info.exception.toString());
				return;
			}
			
			switch(type) {
				case 'all' :
					setState(() {
						if (info.data?['searchCourses'] != null) {
							courses = (info.data?['searchCourses'] as List<dynamic>);
						};
					});
					break;
				case 'enrolled' :
					setState(() {
						if (info.data?['enrolledCourses'] != null) {
							courses = (info.data?['enrolledCourses']['courseId'] as List<dynamic>);
						};
					});
					break;
				case 'watched' :
					setState(() {
						if (info.data?['watchedCourses'] != null) {
							courses = (info.data?['watchedCourses']['courseId'] as List<dynamic>);
						};
					});
					break;
				case 'favorited' :
					setState(() {
						if (info.data?['favoritedCourses'] != null) {
							courses = (info.data?['favoritedCourses']['courseId'] as List<dynamic>);
						};
					});
					break;
				default:
					Navigator.pushNamed(context, HomeRoute);
					break;
			}
		});
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Expanded(
						child: GridView.builder(
							itemCount: courses.length,
							gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
								crossAxisCount: 4,
								mainAxisExtent: ((90/720) * 100).vw,
								mainAxisSpacing: ((15/720) * 100).vw,
							),
							itemBuilder: (_, index) {
								var course = courses[index];
								return Column(
									children: <Widget>[
										CourseCard(
											id: course['id'],
											name: course['name'],
											description: course['description'],
											creator: course['creatorId']['username'],
										)
									]
								);
							},
						)
					),
				],
			),
		);
	}
}
