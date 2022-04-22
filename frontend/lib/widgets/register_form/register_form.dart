import 'package:flutter/material.dart';
import 'package:scaled_size/scaled_size.dart';
import 'package:graphql/client.dart';

import 'package:frontend/routing/paths.dart';
import 'package:frontend/queries/api_mutation.dart';
import 'package:frontend/utils/graphql_client.dart';

class RegisterForm extends StatefulWidget {
	const RegisterForm({Key? key}) : super(key: key);

	@override
	State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
	final emailController = TextEditingController();
	final nameController = TextEditingController();
	final passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Card(
			child: SizedBox(
				width: ((350/1280)*100).vw,
				height: ((450/720)*100).vh,
				child: Column(
					children: <Widget>[
						Text(
							'Register',
							style: Theme.of(context).textTheme.displayMedium,
						),
						Spacer(),
						SizedBox(
							width: ((275/1280)*100).vw,
							height: ((50/720)*100).vh,
							child: TextField(
								controller: emailController,
								decoration: InputDecoration(
									border: OutlineInputBorder(),
									fillColor: Theme.of(context).scaffoldBackgroundColor,
									filled: true,
									icon: Icon(Icons.email),
									hintText: 'Email',
								),
							),
						),
						SizedBox(
							width: ((275/1280)*100).vw,
							height: ((50/720)*100).vh,
							child: TextField(
								controller: nameController,
								decoration: InputDecoration(
									border: OutlineInputBorder(),
									fillColor: Theme.of(context).scaffoldBackgroundColor,
									filled: true,
									icon: Icon(Icons.account_circle),
									hintText: 'Username',
								),
							),
						),
						SizedBox(
							width: ((275/1280)*100).vw,
							height: ((50/720)*100).vh,
							child: TextField(
								controller: passwordController,
								decoration: InputDecoration(
									border: OutlineInputBorder(),
									fillColor: Theme.of(context).scaffoldBackgroundColor,
									filled: true,
									icon: Icon(Icons.lock),
									hintText: 'Password',
								),
								obscureText: true,
							),
						),
						Spacer(),
						SizedBox(
							width: ((250/1280)* 100).vw,
							height: ((50/720) * 100).vh,
							child: Card(
								color: Theme.of(context).primaryColor,
								child: InkWell(
									onTap: () {
										final MutationOptions options = MutationOptions(
											document: gql(registerUser),
											variables: <String, dynamic> {
												'email': emailController.text,
												'username': nameController.text,
												'password': passwordController.text,
											}
										);
										final GraphQLClient client = gqlclient();
										final Future<QueryResult> result = client.mutate(options);
										result.then((info) {
											if (info.hasException) {
												print(info.exception.toString());
												return;
											}
											
											String url = info.data?['registerUser']['url']['nextUrl'];
											if (url == null) {
												url = HomeRoute;
											}
											
											print(info.data?['registerUser']['user']);
											
											Navigator.pushNamed(context, url);
										});
									},
									onHover: (hover) {},
									child: Center(
										child: Text('Create Account'),
									),
								),
							),
						),
					],
				),
			),
		);
	}
}
