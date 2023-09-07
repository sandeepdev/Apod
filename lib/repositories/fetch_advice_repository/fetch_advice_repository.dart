import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchAdvice() async {
  final completer = Completer<String>();
  try {
    const url = 'https://api.adviceslip.com/advice';
    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final advice = data['slip']['advice'];
      completer.complete(advice);
    } else {
      completer.completeError('failed to fetch advice');
    }
  } catch (error) {
    completer.completeError('An error occurred: $error');
  }
  return completer.future;
}
