import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';
import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/queries/api_query.dart';
import 'package:frontend/utils/graphql_client.dart';
import 'package:frontend/widgets/crud_course/page/create_item.dart';
import 'package:frontend/widgets/crud_course/page/delete_item.dart';
import 'package:frontend/widgets/crud_course/page/edit_item.dart';

enum CourseActions { add, edit, delete }

class CourseInformation extends StatefulWidget {
	final String? id;
	final String? name;
	final String? description;
	final String? creator;
	final String? creatorId;
	final String? creationDate;
	final String? lastUpdate;
	final String? enrolledCount;
	
	CourseInformation({Key? key, @required this.id, @required this.name, @required this.description, @required this.creator, @required this.creatorId, @required this.creationDate, @required this.lastUpdate, @required this.enrolledCount}) : super(key: key);

	@override
	State<CourseInformation> createState() => _CourseInformationState();
}

class _CourseInformationState extends State<CourseInformation> {

	bool _creatorOptions = false;

	String _getCourseId() {
		var id = widget.id;
		if (id != null) {
			return id;
		}
		return '1';
	}

	String _getName() {
		var name = widget.name;
		if (name != null) {
			return name;
		}
		return 'Name';
	}
	
	String _getDescription() {
		var description = widget.description;
		if (description != null) {
			return description;
		}
		return 'Description';
	}
	
	String _getCreator() {
		var creator = widget.creator;
		if (creator != null) {
			return creator;
		}
		return 'Creator';
	}
	
	String _getCreatorId() {
		var creatorId = widget.creatorId;
		if (creatorId != null) {
			return creatorId;
		}
		return '1';
	}
	
	String _getCreationDate() {
		var creationDate = widget.creationDate;
		if (creationDate != null) {
			return creationDate;
		}
		return 'February 30, 2077';
	}
	
	String _getLastUpdate() {
		var lastUpdate = widget.lastUpdate;
		if (lastUpdate != null) {
			return lastUpdate;
		}
		return 'February 30, 2077';
	}
	
	String _getEnrolledCount() {
		var enrolledCount = widget.enrolledCount;
		if (enrolledCount != null) {
			return enrolledCount;
		}
		return '999999';
	}

	@override
	Widget build(BuildContext context) {
		final QueryOptions options = QueryOptions(
			document: gql(whoami)
		);
		final GraphQLClient client = gqlclient();
		final Future<QueryResult> result = client.query(options);
		
		result.then((info) {
			if (info.hasException) {
				print(info.exception.toString());
				return;
			}
			
			if (info.data?['whoami'] != null) {
				if (info.data?['whoami']['id'] == _getCreatorId()) {
					if (_creatorOptions != true) {
						setState(() {
							_creatorOptions = true;
						});
					}
					return;
				}
			}
			if (_creatorOptions != false) {
				setState(() {
					_creatorOptions = false;
				});
			}
		});
		
		return SizedBox(
			width: ((1100/1280) * 100).vw,
			height: ((525/720) * 100).vh,
			child: Column(
				children: <Widget>[
					SizedBox(
						width: ((1100/1280) * 100).vw,
						height: ((60/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Row(
									children: <Widget>[
										Text(
											_getName(),
											style: Theme.of(context).textTheme.headlineSmall,
										),
										Spacer(),
										PopupMenuButton<CourseActions>(
											enabled: _creatorOptions,
											icon: Icon(Icons.more_horiz),
											offset: Offset(0, 60),
											itemBuilder: (context) => [
												PopupMenuItem(
													value: CourseActions.add,
													child: ListTile(
														leading: Icon(Icons.add),
														title: Text('Add Course Item'),
													),
												),
												PopupMenuItem(
													value: CourseActions.edit,
													child: ListTile(
														leading: Icon(Icons.edit),
														title: Text('Edit Course Item'),
													),
												),
												PopupMenuItem(
													value: CourseActions.delete,
													child: ListTile(
														leading: Icon(Icons.delete),
														title: Text('Delete Course Item'),
													),
												),
											],
											onSelected: (value) {
												if (value == CourseActions.add) {
													create_item_dialog(context);
												}
												else if (value == CourseActions.edit) {
													edit_item_dialog(context);
												}
												else if (value == CourseActions.delete) {
													delete_item_dialog(context);
												}
											},
										),
									],
								),
							),
						),
					),
					SizedBox(
						width: ((1100/1280) * 100).vw,
						height: ((80/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										SizedBox(
											width: ((1060/1280)* 100).vw,
											height: ((55/720) * 100).vh,
											child: Card(
												color: Theme.of(context).primaryColor,
												child: InkWell(
													onTap: () {},
													onHover: (hover) {},
													child: Center(
														child: Text('About'),
													),
												),
											),
										),
										/*
										SizedBox(
											width: ((530/1280)* 100).vw,
											height: ((55/720) * 100).vh,
											child: Card(
												color: Theme.of(context).primaryColor,
												child: InkWell(
													onTap: () {},
													onHover: (hover) {},
													child: Center(
														child: Text('Breakdown'),
													),
												),
											),
										),
										*/
									],
								),
							),
						),
					),
					SizedBox(
						width: ((1100/1280) * 100).vw,
						height: ((250/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: SingleChildScrollView(
									scrollDirection: Axis.vertical,
									child: RichText(
										text: TextSpan(
											text: _getDescription(),
											style: Theme.of(context).textTheme.labelLarge,
										),
									),
								),
							),
						),
					),
					SizedBox(
						width: ((1100/1280) * 100).vw,
						height: ((50/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Row(
									children: <Widget>[
										Spacer(),
										Tooltip(
											message: 'Creator Name',
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Icon(Icons.person_outline),
													Text(_getCreator()),
												],
											),
										),
										Spacer(),
										Container(
											height: ((50/720) * 0.9 * 100).vh,
											child: VerticalDivider(
												thickness: 3,
												color: Theme.of(context).primaryColor,
											),
										),
										Spacer(),
										Tooltip(
											message: 'Creation Date',
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Icon(Icons.calendar_today_outlined),
													Text(_getCreationDate()),
												],
											),
										),
										Spacer(),
										Container(
											height: ((50/720) * 0.9 * 100).vh,
											child: VerticalDivider(
												thickness: 3,
												color: Theme.of(context).primaryColor,
											),
										),
										Spacer(),
										Tooltip(
											message: 'Last Update',
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Icon(Icons.edit_calendar_outlined),
													Text(_getLastUpdate()),
												],
											),
										),
										Spacer(),
										Container(
											height: ((50/720) * 0.9 * 100).vh,
											child: VerticalDivider(
												thickness: 3,
												color: Theme.of(context).primaryColor,
											),
										),
										Spacer(),
										Tooltip(
											message: 'Enrolled Users',
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Icon(Icons.group_outlined),
													Text(_getEnrolledCount()),
												],
											),
										),
										Spacer(),
									],
								),
							),
						),
					),
					SizedBox(
						width: ((275/1280) * 100).vw,
						height: ((75/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										IconButton(
											icon: const Icon(Icons.favorite_outline),
											tooltip: 'Favorite',
											onPressed:  () {
												final MutationOptions options = MutationOptions(
													document: gql(favoriteCourse),
													variables: <String, dynamic> {
														'courseId': _getCourseId(),
													}
												);
												final GraphQLClient client = gqlclient();
												final Future<QueryResult> result = client.mutate(options);
												result.then((info) {
													if (info.hasException) {
														print(info.exception.toString());
														return;
													}
													
													if (info.data?['favoriteCourse']['favoriteCourse'] != null) {
														ScaffoldMessenger.of(context).showSnackBar(
															SnackBar(
																content: Text('Favorited course')
															)
														);
													}
												});
											},
										),
										IconButton(
											icon: const Icon(Icons.bookmark_outline),
											tooltip: 'Bookmark',
											onPressed: () {
												final MutationOptions options = MutationOptions(
													document: gql(watchCourse),
													variables: <String, dynamic> {
														'courseId': _getCourseId(),
													}
												);
												final GraphQLClient client = gqlclient();
												final Future<QueryResult> result = client.mutate(options);
												result.then((info) {
													if (info.hasException) {
														print(info.exception.toString());
														return;
													}
													
													if (info.data?['watchCourse']['watchCourse'] != null) {
														ScaffoldMessenger.of(context).showSnackBar(
															SnackBar(
																content: Text('Watching course')
															)
														);
													}
												});
											},
										),
										IconButton(
											icon: const Icon(Icons.local_library_outlined),
											tooltip: 'Enroll',
											onPressed: () {
												final MutationOptions options = MutationOptions(
													document: gql(enrollCourse),
													variables: <String, dynamic> {
														'courseId': _getCourseId(),
													}
												);
												final GraphQLClient client = gqlclient();
												final Future<QueryResult> result = client.mutate(options);
												result.then((info) {
													if (info.hasException) {
														print(info.exception.toString());
														return;
													}
													
													if (info.data?['enrollCourse']['enrollCourse'] != null) {
														ScaffoldMessenger.of(context).showSnackBar(
															SnackBar(
																content: Text('Enrolled in course')
															)
														);
													}
												});
											},
										),
										IconButton(
											icon: const Icon(Icons.share),
											tooltip: 'Share',
											onPressed: () {
												Clipboard.setData(
													ClipboardData(
														text: 'localhost:36097/#${ModalRoute.of(context)?.settings.name}',
													)
												).then((_) {
													ScaffoldMessenger.of(context).showSnackBar(
														SnackBar(
															content: Text('Copied link to clipboard')
														)
													);
												});
											},
										),
									],
								),
							),
						),
					),
				],
			),
		);
	}
}
