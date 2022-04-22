import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

GraphQLClient gqlclient() {
	HttpLink httpLink = HttpLink("http://127.0.0.1:8000/graphql");
	return GraphQLClient(
		link: httpLink,
		cache: GraphQLCache(),
	);
}

