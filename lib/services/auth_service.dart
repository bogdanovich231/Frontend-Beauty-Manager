import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'zwjg64qp11.execute-api.eu-west-1.amazonaws.com';
  Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    final url = Uri.https(baseUrl, '/prod/users');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
        'image': '',
        'is_admin': false,
      }),
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.https(baseUrl, '/prod/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final responseData = json.decode(response.body);

    if (response.statusCode == 201 &&
        responseData['message'] == 'Register successful') {
      return {'success': true, "data": responseData};
    } else {
      return {
        'success': false,
        'message': responseData['message'] ?? 'An error occurred',
      };
    }
  }
}
