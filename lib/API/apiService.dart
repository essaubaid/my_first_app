import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClass {
  final int postId;
  final String name;
  final String email;
  final String body;

  const ApiClass({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory ApiClass.fromJason(Map<String, dynamic> json) {
    return ApiClass(
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}

class ApiService {
  Future<List<ApiClass>> getAPI() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/comments"),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      //data.forEach((e) => {print(e)});

      final List<ApiClass> list = [];

      // ignore: avoid_function_literals_in_foreach_calls
      data.forEach(
        (e) => list.add(
          ApiClass.fromJason(e),
        ),
      );

      return list;
    } else {
      throw Exception('HTTP Failed');
    }
  }
}
