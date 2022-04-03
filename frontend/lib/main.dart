import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:frontend/services/theme_provider.dart';
import 'package:frontend/eLearningApp.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await initHiveForFlutter();
	
	SharedPreferences prefs = await SharedPreferences.getInstance();
	final HttpLink httpLink = HttpLink("http://127.0.0.1:8000/graphql");
	ValueNotifier<GraphQLClient> graphQlClient = ValueNotifier(
		GraphQLClient(
			link: httpLink,
			cache: GraphQLCache(store: HiveStore()),
		),
	);
	runApp(
		GraphQLProvider(
			client: graphQlClient,
			child: ChangeNotifierProvider(
				create: (BuildContext context) => ThemeProvider(theme: prefs.getBool('theme') ?? false),
				child: eLearningApp(),
			),
		),
	);
}
