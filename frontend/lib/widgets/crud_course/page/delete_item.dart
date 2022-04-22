import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';

import 'package:frontend/widgets/crud_course/course/delete_course.dart';
import 'package:frontend/widgets/crud_course/unit/delete_unit.dart';
import 'package:frontend/widgets/crud_course/subunit/delete_subunit.dart';
import 'package:frontend/widgets/crud_course/learning_block/delete_learning_block.dart';
import 'package:frontend/widgets/crud_course/test/delete_test.dart';
import 'package:frontend/widgets/crud_course/question/delete_question.dart';
import 'package:frontend/widgets/crud_course/question_choice/delete_question_choice.dart';

void delete_item_dialog(BuildContext context) {
	showDialog(
		context: context,
		builder: (BuildContext context) {

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
							'Delete Item',
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
										delete_course_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Course'),
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
										delete_unit_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Unit'),
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
										delete_subunit_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Subunit'),
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
										delete_learning_block_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Learning Block'),
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
										delete_test_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Test'),
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
										delete_question_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Question'),
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
										delete_question_choice_dialog(context);
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Delete Question Choice'),
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
