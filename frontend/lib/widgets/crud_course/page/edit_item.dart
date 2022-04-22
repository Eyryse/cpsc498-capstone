import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/utils/graphql_client.dart';
import 'package:frontend/widgets/crud_course/course/edit_course.dart';

void edit_item_dialog(BuildContext context) {
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
							'Edit Item',
							style: Theme.of(context).textTheme.displayMedium,
						),
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((60/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Edit Course'),
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
