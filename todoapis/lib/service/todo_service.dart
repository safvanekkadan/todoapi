import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todoapis/model/todo_model.dart';

class TodoServices {
  final Dio _dio = Dio();
  Future<List<TodoModel>> fetchTodo() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      final json = response.data as Map<String, dynamic>;
      final result = json['items'] as List;
      return result.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch");
    }
  }

  ///add data
  Future<void> SubmitData(TodoModel requestModel) async {
    final body = requestModel.toJson();
    const url = "https://api.nstack.in/v1/todos";
    final response = await _dio.post(
      url,
      data: jsonEncode(body),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 201) {
      print("create success");
    } else {
      print("create failed");
    }
  }
  //delete

  Future<void> deleteById(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final response = await _dio.delete(url);
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      print("error");
    }
  }

  //Update
  Future<void> UpdateData(requestModel, id) async {
    final body = requestModel.toJson();
    final url = "https://api.nstack.in/v1/todos/$id";
    final response = await _dio.put(
      url,
      data: jsonEncode(body),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    if (response.statusCode == 200) {
      print("updation success");
    } else {
      print("Updation failed");
      print('Response body: ${response.data}');
      print('Error Response Body: ${response.data}');
      throw Exception('update failed');
    }
  }
}
