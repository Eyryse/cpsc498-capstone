import 'package:flutter/material.dart';
import 'package:format/format.dart';
import 'package:graphql/client.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/queries/api_query.dart';
import 'package:frontend/utils/graphql_client.dart';

enum AccountOptions { settings, profile }

class AccountButton extends StatefulWidget {
	const AccountButton({Key? key}) : super(key: key);
	
	@override
	State<AccountButton> createState() => _AccountButtonState();
}

class _AccountButtonState extends State<AccountButton> {

	@override
	Widget build(BuildContext context) {
		return PopupMenuButton<AccountOptions>(
			icon: Icon(Icons.person),
			iconSize: 45,
			offset: Offset(0, 60),
			itemBuilder: (context) => [
				PopupMenuItem(
					value: AccountOptions.profile,
					child: ListTile(
						leading: Icon(Icons.assignment_ind),
						title: Text('Profile'),
					),
				),
				/*
				PopupMenuItem(
					value: AccountOptions.settings,
					child: ListTile(
						leading: Icon(Icons.settings),
						title: Text('Settings'),
					),
				),
				*/
			],
			onSelected: (value) {
				if (value == AccountOptions.settings) {
					Navigator.pushNamed(context, SettingsRoute);
				}
				else if (value == AccountOptions.profile) {
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
							Map<String, String> queryParams = {
								'id': info.data?['whoami']['id'],
							};
							Navigator.pushNamed(
								context,
								'{}?{}'.format(
									UserProfileRoute,
									Uri(queryParameters: queryParams).query,
								)
							);
						}
						else {
							Navigator.pushNamed(context, HomeRoute);
						}
					});
				}
			},
		);
	}
}
