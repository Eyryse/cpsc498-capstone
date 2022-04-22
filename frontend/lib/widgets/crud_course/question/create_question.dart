import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/utils/graphql_client.dart';

void create_question_dialog(BuildContext context) {
	showDialog(
		context: context,
		builder: (BuildContext context) {
			final durationController = TextEditingController();
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
							'Create Question',
							style: Theme.of(context).textTheme.displayMedium,
						),
						SizedBox(
							width: ((510/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: DropdownButton<String>(
									value: '',
									icon: const Icon(Icons.arrow_downward),
									onChanged: (String? newValue) {
									},
									items: List.empty(),
								),
							),
						),
						SizedBox(
							width: ((510/1280)*100).vw,
							height: ((50/720)*100).vh,
							child: TextField(
								controller: durationController,
								decoration: InputDecoration(
									border: OutlineInputBorder(),
									fillColor: Theme.of(context).scaffoldBackgroundColor,
									filled: true,
									hintText: 'Question Duration',
								),
							),
						),
						SizedBox(
							width: ((510/1280)*100).vw,
							height: ((250/720)*100).vh,
							child: TextField(
								expands: true,
								maxLines: null,
								controller: descriptionController,
								textAlignVertical: TextAlignVertical.top,
								decoration: InputDecoration(
									border: OutlineInputBorder(),
									fillColor: Theme.of(context).scaffoldBackgroundColor,
									filled: true,
									hintText: 'Question Description',
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
										final MutationOptions options = MutationOptions(
											document: gql(addQuestionToTest),
											variables: <String, dynamic> {
												'testId' : '1',
												'duration' : durationController.text,
												'description' : descriptionController.text,
												'questionType' : 'single',
											}
										);
										final GraphQLClient client = gqlclient();
										final Future<QueryResult> result = client.mutate(options);
										
										result.then((info) {
											if (info.hasException) {
												print(info.exception.toString());
												return;
											}
											
											String url = info.data?['addQuestionToTest']['url']['nextUrl'];
											Navigator.pushNamed(context, url);
										});
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Question'),
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
