import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:flutter/services.dart';
import 'package:graphql/client.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/queries/api_query.dart';
import 'package:frontend/utils/graphql_client.dart';

class UserInformation extends StatefulWidget {
	final arguments;
	
	UserInformation({Key? key, @required this.arguments}) : super(key: key);

	@override
	State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
	String name = '';
	String description = '';

	@override
	Widget build(BuildContext context) {
		var id = widget.arguments?['id'];
	
		if (id == null) {
			Navigator.pushNamed(context, HomeRoute);
		}
		
		final QueryOptions options = QueryOptions(
			document: gql(userFromId),
			variables: <String, dynamic> {
				'id': id,
			},
		);
		final GraphQLClient client = gqlclient();
		final Future<QueryResult> result = client.query(options);
		
		result.then((info) {
			if (info.hasException) {
				print(info.exception.toString());
				return;
			}
			
			if (info.data?['userFromId'] != null) {
				setState(() {
					name = info.data?['userFromId']['username'];
					description = info.data?['userFromId']['description'];
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
								child: Center(
									child: Text(
										name,
										style: Theme.of(context).textTheme.headlineSmall,
									),
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
											width: ((530/1280)* 100).vw,
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
										SizedBox(
											width: ((530/1280)* 100).vw,
											height: ((55/720) * 100).vh,
											child: Card(
												color: Theme.of(context).primaryColor,
												child: InkWell(
													onTap: () {},
													onHover: (hover) {},
													child: Center(
														child: Text('Creations'),
													),
												),
											),
										),
									],
								),
							),
						),
					),
					SizedBox(
						width: ((1100/1280) * 100).vw,
						height: ((375/720) * 100).vh,
						child: Card(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: SingleChildScrollView(
									scrollDirection: Axis.vertical,
									child: RichText(
										text: TextSpan(
											text: description,
											style: Theme.of(context).textTheme.titleSmall,
										),
									),
								),
							),
						),
					),
				],
			),
		);
	}
}
