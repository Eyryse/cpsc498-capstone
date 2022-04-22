import 'package:flutter/material.dart';

class ExtractResult {
	String? name;
	Map<String, String>? args;
	
	ExtractResult({@required this.name, @required this.args});
	
	String retrieveArgument(String argument) {
		var arg = '';
		if (this.args != null) {
			arg = this.args!.entries.singleWhere((element) => element.key == argument).value;
		}
		return arg;
	}
}

ExtractResult extractFromContext(BuildContext context) {
	final settingsSplit = ModalRoute.of(context)?.settings.name == null ? ['', ''] : ModalRoute.of(context)!.settings.name!.split('?');
	final name = settingsSplit[0];
	final args = (settingsSplit.length <= 1 ? Uri(query: '') : Uri(query: settingsSplit[1])).queryParameters;
	
	return ExtractResult(
		name: name,
		args: args,
	);
}

ExtractResult extractFromRoute(RouteSettings settings) {
	final settingsSplit = settings.name == null ? ['', ''] : settings.name!.split('?');
	final name = settingsSplit[0];
	final args = (settingsSplit.length <= 1 ? Uri(query: '') : Uri(query: settingsSplit[1])).queryParameters;
	
	return ExtractResult(
		name: name,
		args: args,
	);
}
