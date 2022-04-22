import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/utils/graphql_client.dart';
import 'package:frontend/widgets/crud_course/unit/create_unit.dart';
import 'package:frontend/widgets/crud_course/subunit/create_subunit.dart';
import 'package:frontend/widgets/crud_course/learning_block/create_learning_block.dart';
import 'package:frontend/widgets/crud_course/test/create_test.dart';
import 'package:frontend/widgets/crud_course/question/create_question.dart';
import 'package:frontend/widgets/crud_course/question_choice/create_question_choice.dart';

void create_item_dialog(BuildContext context) {
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
							'Create Item',
							style: Theme.of(context).textTheme.displayMedium,
						),
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
										Navigator.of(context).pop();
										create_unit_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Unit'),
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
										create_subunit_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Subunit'),
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
										create_learning_block_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Learning Block'),
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
										create_test_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Test'),
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
										create_question_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Question'),
									),
								),
							),
						),
						/*
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
										Navigator.of(context).pop();
										create_question_choice_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Question Choice'),
									),
								),
							),
						),
						*/
					],
				),
			);
		},
	);
}
