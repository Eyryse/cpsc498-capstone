import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart';

class NotificationsButton extends StatefulWidget {
	const NotificationsButton({Key? key}) : super(key: key);
	
	@override
	State<NotificationsButton> createState() => _NotificationsButtonState();
}

class _NotificationsButtonState extends State<NotificationsButton> {
	var _notifications = 0;
	
	void _setNotifications(BuildContext context) {
		setState(() {
			_notifications = 0;
		});
	}

	@override
	Widget build(BuildContext context) {
		_setNotifications(context);
		return Badge(
			position: BadgePosition.topEnd(top: 0, end: 3),
			badgeColor: Theme.of(context).backgroundColor,
			badgeContent: Text(_notifications.toString()),
			showBadge: _notifications == 0 ? false : true,
			child: IconButton(
				icon: Icon(Icons.notifications),
				iconSize: 45,
				onPressed: () {},
			),
		);
	}
}
