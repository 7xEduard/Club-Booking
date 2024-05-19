import 'package:clubs_booking/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  Future<http.Response> registerPushData(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber}) async {
    return http.post(
      Uri.parse('https://users-api-ko8o.onrender.com/api/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": name,
        "email": email,
        "password": password,
        "role": "USER",
        "phoneNumber": phoneNumber
      }),
    );
  }

  Future<http.Response> loginPushData(
      {required String email, required String password}) async {
    return http.post(
      Uri.parse('https://users-api-ko8o.onrender.com/api/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );
  }

  Future<bool> loginResponse(
      {required String email, required String password}) async {
    String status;
    http.Response response = await loginPushData(
      email: email,
      password: password,
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    status = data["status"];

    if (status == "success") {
      return true;
    } else {
      return false;
    }
  }

  Future<ResponseModel> regirterResponse(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber}) async {
    ResponseModel responseModel;
    http.Response response = await registerPushData(
        name: name, email: email, password: password, phoneNumber: phoneNumber);
    Map<String, dynamic> data = jsonDecode(response.body);

    responseModel = ResponseModel.fromJson(data);
    return responseModel;
  }
}
