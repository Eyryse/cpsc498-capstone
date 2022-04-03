import 'package:flutter/material.dart';

import 'package:frontend/widgets/navigation_bar/navigation_bar.dart';

class LoginPage extends StatefulWidget {
	const LoginPage({Key? key}) : super(key: key);

	@override
	State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					NavBar(),
					Spacer(),
					SizedBox(
						width: MediaQuery.of(context).size.width * (350/1280),
						height: MediaQuery.of(context).size.height * (350/720),
						child: Card(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									Text(
										'Login',
										style: Theme.of(context).textTheme.titleLarge,
									),
									SizedBox(
										width: MediaQuery.of(context).size.width * (250/1280),
										height: MediaQuery.of(context).size.height * (50/720),
										child: TextField(
											decoration: InputDecoration(
												border: OutlineInputBorder(),
												fillColor: Theme.of(context).scaffoldBackgroundColor,
												filled: true,
												hintText: 'Username or Email',
											),
										),
									),
									SizedBox(
										width: MediaQuery.of(context).size.width * (250/1280),
										height: MediaQuery.of(context).size.height * (50/720),
										child: TextField(
											decoration: InputDecoration(
												border: OutlineInputBorder(),
												fillColor: Theme.of(context).scaffoldBackgroundColor,
												filled: true,
												hintText: 'Password',
											),
										),
									),
									SizedBox(
										width: MediaQuery.of(context).size.width * (250/1280),
										height: MediaQuery.of(context).size.height * (50/720),
										child: Card(
											color: Theme.of(context).primaryColor,
											child: InkWell(
												onTap: () {},
												onHover: (hover) {},
												child: Center(
													child: Text('Login'),
												),
											),
										),
									),
									SizedBox(
										width: MediaQuery.of(context).size.width * (250/1280),
										height: MediaQuery.of(context).size.height * (50/720),
										child: Card(
											color: Theme.of(context).primaryColor,
											child: InkWell(
												onTap: () {},
												onHover: (hover) {},
												child: Center(
													child: Text('Forgot Password'),
												),
											),
										),
									),
								],
							),
						),
					),
					Spacer(),
				],
			),
		);
	}
}
