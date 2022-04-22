import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/utils/graphql_client.dart';
import 'package:frontend/utils/argument_parse.dart';

void delete_course_dialog(BuildContext context) {
	showDialog(
		context: context,
		builder: (BuildContext context) {
			final nameController = TextEditingController();
			final descriptionController = TextEditingController();

			return AlertDialog(
				scrollable: true,
				content: Column(
					children: <Widget>[
						Align(
							alignment: Alignment.topRight,
							child: IconButton(
								icon: const Icon(Icons.close),
								onPressed: () {
									Navigator.of(context).pop();
								},
							),
						),
						Text(
							'Delete Course',
							style: Theme.of(context).textTheme.displayMedium,
						),
						Text(
							'Are you sure?',
							style: Theme.of(context).textTheme.displaySmall,
						),
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
										final MutationOptions options = MutationOptions(
											document: gql(deleteCourse),
											variables: <String, dynamic> {
												'courseId': extractFromContext(context).retrieveArgument('id'),
											}
										);
										final GraphQLClient client = gqlclient();
										final Future<QueryResult> result = client.mutate(options);
										
										result.then((info) {
											if (info.hasException) {
												print(info.exception.toString());
												return;
											}
											
											String url = info.data?['deleteCourse']['url']['nextUrl'];
											Navigator.pushNamed(context, url);
										});
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Yes'),
									),
								),
							),
						),
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
										Navigator.of(context).pop();
									},
									onHover: (hover) {},
									child: Center(
										child: Text('No'),
									),
								),
							),
						),
					],
				),
			);
		},
	);
}
