import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<Response> getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }

  Future<Response> postRequest(String url, Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(url), body: data);
    return response;
  }

  Future<Response> putRequest(String url, Map<String, dynamic> data) async {
    final response = await http.put(Uri.parse(url), body: data);
    return response;
  }

  Future<Response> deleteRequest(
    String url,
  ) async {
    final response = await http.post(Uri.parse(url));
    return response;
  }
}
