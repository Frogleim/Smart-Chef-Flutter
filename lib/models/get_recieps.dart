import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRecieps {
  final String reciep;
  final String ingredients;

  GetRecieps({required this.reciep, required this.ingredients});

  factory GetRecieps.fromJson(Map<String, dynamic> json) {
    return GetRecieps(reciep: json['recipe'], ingredients: json['ingredients']);
  }
}

Future getRecipes(String ingredients) async {
  var response = await http
      .get(Uri.parse('http://192.168.18.110/get_recipes/$ingredients'));

  var jsonData = jsonDecode(response.body);
  List<GetRecieps> recieps = [];
  for (var items in jsonData['Data']) {
    GetRecieps reciep =
        GetRecieps(reciep: items['recipe'], ingredients: items['ingredients']);

    recieps.add(reciep);
  }
  print(recieps.length);

  return recieps;
}
