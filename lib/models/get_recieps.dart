import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRecieps {
  final String reciep;
  final String ingredients;
  final String recUrl;

  GetRecieps(
      {required this.reciep, required this.ingredients, required this.recUrl});

  factory GetRecieps.fromJson(Map<String, dynamic> json) {
    return GetRecieps(
        reciep: json['recipe'],
        ingredients: json['ingredients'],
        recUrl: json['url']);
  }
}

Future getRecipes(String ingredients) async {
  var response = await http
      .get(Uri.parse('http://192.168.18.110/get_recipes/$ingredients'));

  var jsonData = jsonDecode(response.body);
  List<GetRecieps> recieps = [];
  for (var items in jsonData['Data']) {
    GetRecieps reciep = GetRecieps(
        reciep: items['recipe'],
        ingredients: items['ingredients'],
        recUrl: items['url']);

    recieps.add(reciep);
  }
  print(recieps.length);

  return recieps;
}

Future<String> getDetails(
  String recUrl,
) async {
  final url = Uri.parse(
      'http://192.168.18.110/get_recipes_details'); // Replace with your API endpoint

  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final body = jsonEncode({'recipes_url': recUrl});

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    // Request successful, handle the response
    print('Response: ${response.body}');
  } else {
    // Request failed, handle the error
    print('Error: ${response.statusCode}');
  }
  return response.body;
}
