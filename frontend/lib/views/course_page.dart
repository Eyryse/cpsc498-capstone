import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/widgets/course_information/course_information.dart';
import 'package:frontend/queries/api_query.dart';
import 'package:frontend/utils/graphql_client.dart';

class CoursePage extends StatefulWidget {
	final arguments;
	
	CoursePage({Key? key, @required this.arguments}) : super(key: key);

	@override
	State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

	@override
	Widget build(BuildContext context) {
		String id = widget.arguments?['id'];
		String name = '';
		String description = '';
		String creator = '';
		String creatorId = '';
		String creationDate = '';
		String lastUpdate = '';
		String enrolledCount = '';
		
		final QueryOptions options = QueryOptions(
			document: gql(courseFromId),
			variables:  <String, dynamic> {
				'id': id,
			}
		);
		final GraphQLClient client = gqlclient();
		final Future<QueryResult> result = client.query(options);
		result.then((info) {
			if (info.hasException) {
				print(info.exception.toString());
				return;
			}
			
			if (info.data?['courseFromId'] != null) {
				name = info.data?['courseFromId']['name'];
				description = info.data?['courseFromId']['description'];
				creationDate = info.data?['courseFromId']['creationDate'];
				lastUpdate = info.data?['courseFromId']['lastUpdate'];
				creator = info.data?['courseFromId']['creatorId']['username'];
				creatorId = info.data?['courseFromId']['creatorId']['id'];
			}
		});
		
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					CourseInformation(
						id: id,
						name: name,
						description: description,
						creator: creator,
						creationDate: creationDate,
						lastUpdate: lastUpdate,
						enrolledCount: enrolledCount,
					),
					Spacer(),
				],
			),
		);
	}
}
