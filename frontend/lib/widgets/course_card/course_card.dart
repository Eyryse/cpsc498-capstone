import 'package:flutter/material.dart';
import 'package:format/format.dart';
import 'package:scaled_size/scaled_size.dart';

import 'package:frontend/routing/paths.dart';

class CourseCard extends StatefulWidget {
	final String? id;
	final String? name;
	final String? creator;
	final String? description;

	const CourseCard({Key? key, @required this.id, @required this.name, @required this.creator, @required this.description}) : super(key: key);
	
	@override
	State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {

	String _getId() {
		var id = widget.id;
		if (id != null) {
			return id;
		}
		return '';
	}
	
	String _getCreator() {
		var creator = widget.creator;
		if (creator != null) {
			return creator;
		}
		return '';
	}
	
	String _getName() {
		var id = widget.id;
		if (id != null) {
			return id;
		}
		return '';
	}

	@override
	Widget build(BuildContext context) {
		return Card(
			elevation: 4.0,
			child: SizedBox(
				width: ((220/1280)*100).vw,
				height: ((130/720)*100).vh,
				child: InkWell(
					onTap: () {
						var id = widget.id;
						if (id != null) {
							Map<String, String> queryParams = {
								'id': '{}'.format(_getId()),
							};
							Navigator.pushNamed(
								context,
								'{}?{}'.format(
									CourseRoute,
									Uri(queryParameters: queryParams).query,
								)
							);
						}
					},
					onHover: (hover) {},
					child: Padding(
						padding: const EdgeInsets.all(8.0),
						child: Column(
							children: <Widget>[
								Row(
									children: <Widget>[
										Text(
											_getName(),
											style: Theme.of(context).textTheme.titleLarge,
										),
									],
								),
								Spacer(),
								Row(
									children: <Widget>[
										Text(
											_getCreator(),
											style: Theme.of(context).textTheme.labelLarge,
										),
									],
								),
							],
						),
					),
				),
			),
		);
	}
}
