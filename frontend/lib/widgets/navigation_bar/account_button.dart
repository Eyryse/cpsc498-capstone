import 'package:flutter/material.dart';

import 'package:frontend/routing/paths.dart';

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
				PopupMenuItem(
					value: AccountOptions.settings,
					child: ListTile(
						leading: Icon(Icons.settings),
						title: Text('Settings'),
					),
				),
			],
			onSelected: (value) => {
				if (value == AccountOptions.settings) {
					Navigator.pushNamed(context, SettingsRoute)
				}
				else if (value == AccountOptions.profile) {
					Navigator.pushNamed(context, UserProfileRoute)
				}
			},
		);
	}
}
