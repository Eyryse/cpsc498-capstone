import 'package:flutter/material.dart';
import 'package:format/format.dart';

import 'package:frontend/routing/paths.dart';

class SearchBar extends StatefulWidget {
	const SearchBar({Key? key}) : super(key: key);
	
	@override
	State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
			child: TextField(
				decoration: InputDecoration(
					border: OutlineInputBorder(),
					fillColor: Theme.of(context).scaffoldBackgroundColor,
					filled: true,
					hintText: 'Search for courses here',
				),
				onSubmitted: (String value) {
					Map<String, String> queryParams = {
						'type': 'all',
						'search': value,
					};
					Navigator.pushNamed(
						context,
						'{}?{}'.format(
							LibraryRoute,
							Uri(queryParameters: queryParams).query,
						)
					);
				},
			),
		);
	}
}

